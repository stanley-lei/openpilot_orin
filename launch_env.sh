#!/usr/bin/bash

export ORIN=1
export ZMQ=1
export POCL_DEVICES=cuda
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1

if [ -z "$AGNOS_VERSION" ]; then
  export AGNOS_VERSION="5.2"
fi

if [ -z "$PASSIVE" ]; then
  export PASSIVE="1"
fi

#export STAGING_ROOT="/data/safe_staging"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export STAGING_ROOT="/home/nvidia/workspace/safe_staging"
export PYTHONPATH=$SCRIPT_DIR:$PYTHONPATH
export LD_LIBRARY_PATH=$SCRIPT_DIR/third_party/snpe/larch64:$LD_LIBRARY_PATH
