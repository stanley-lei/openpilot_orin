#!/usr/bin/env python3

import os
import sys
import numpy as np

os.environ["OMP_NUM_THREADS"] = "4"
os.environ["OMP_WAIT_POLICY"] = "PASSIVE"

import onnxruntime as ort  # pylint: disable=import-error


def read(sz, tf8=False):
  buf = b""
  expected = sz * (1 if tf8 else 4)
  while len(buf) < expected:
    chunk = os.read(0, expected - len(buf))
    if not chunk:
      raise EOFError(f"Expected {expected} bytes, got {len(buf)} before EOF")
    buf += chunk
  r = np.frombuffer(buf, dtype=np.uint8 if tf8 else np.float32).astype(np.float32)
  if tf8:
    r = r / 255.
  return r


def write(d):
  os.write(1, d.tobytes())


def run_loop(m, tf8_input=False):
  inputs_meta = m.get_inputs()
  ishapes = [[1] + i.shape[1:] for i in inputs_meta]
  keys = [i.name for i in inputs_meta]
  idtypes = []

  for i in inputs_meta:
    if "uint8" in i.type:
      idtypes.append(np.uint8)
    elif "float" in i.type:
      idtypes.append(np.float32)
    else:
      raise RuntimeError(f"Unsupported input type: {i.type}")

  # warm-up pass for GPU
  if "CUDAExecutionProvider" in m.get_providers():
    m.run(None, {k: np.zeros(s, dtype=t) for k, s, t in zip(keys, ishapes, idtypes)})

  print("ready to run onnx model", keys, ishapes, file=sys.stderr)

  while True:
    inputs = []
    for k, shp, dtype in zip(keys, ishapes, idtypes):
      ts = np.product(shp)
      if k == 'input_img' and tf8_input and dtype == np.float32:
        raw = read(ts, tf8=True).reshape(shp)
      else:
        raw = read(ts, tf8=False).reshape(shp).astype(dtype)
      inputs.append(raw)

    ret = m.run(None, dict(zip(keys, inputs)))
    for r in ret:
      print("output:", r.shape, file=sys.stderr)
      write(r)


if __name__ == "__main__":
  print(sys.argv, file=sys.stderr)
  print("Onnx available providers: ", ort.get_available_providers(), file=sys.stderr)

  options = ort.SessionOptions()
  options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_DISABLE_ALL

  if 'OpenVINOExecutionProvider' in ort.get_available_providers() and 'ONNXCPU' not in os.environ:
    provider = 'OpenVINOExecutionProvider'
  elif 'CUDAExecutionProvider' in ort.get_available_providers() and 'ONNXCPU' not in os.environ:
    options.intra_op_num_threads = 2
    provider = 'CUDAExecutionProvider'
  else:
    options.intra_op_num_threads = 2
    options.inter_op_num_threads = 8
    options.execution_mode = ort.ExecutionMode.ORT_SEQUENTIAL
    options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_ALL
    provider = 'CPUExecutionProvider'

  try:
    print("Onnx selected provider: ", [provider], file=sys.stderr)
    ort_session = ort.InferenceSession(sys.argv[1], options, providers=[provider])
    print("Onnx using ", ort_session.get_providers(), file=sys.stderr)
    run_loop(ort_session, tf8_input=("--use_tf8" in sys.argv))
  except KeyboardInterrupt:
    pass

