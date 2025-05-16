#!/bin/bash
# 查找所有包含 OpenCL image 相关函数的源文件

echo "🔍 搜索以下 OpenCL 图像相关函数/类型："
cat <<EOF
image1d_t\nimage2d_t\nimage3d_t\nimage1d_array_t\nimage2d_array_t\nimage1d_buffer_t\nsampler_t\nread_imagef\nread_imagei\nread_imageui\nwrite_imagef\nwrite_imagei\nwrite_imageui\nclCreateImage\nclEnqueueReadImage\nclEnqueueWriteImage\nclEnqueueCopyImage\nclEnqueueCopyImageToBuffer\nclEnqueueCopyBufferToImage\nclGetSupportedImageFormats\nclGetImageInfo\nCL_MEM_OBJECT_IMAGE1D\nCL_MEM_OBJECT_IMAGE2D\nCL_MEM_OBJECT_IMAGE3D\nCL_DEVICE_IMAGE_SUPPORT
EOF

echo ""
echo "📁 当前目录：$(pwd)"
echo ""

found_any=false

echo "🔎 查找关键字: image1d_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image1d_t' . && found_any=true
echo ""

echo "🔎 查找关键字: image2d_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image2d_t' . && found_any=true
echo ""

echo "🔎 查找关键字: image3d_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image3d_t' . && found_any=true
echo ""

echo "🔎 查找关键字: image1d_array_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image1d_array_t' . && found_any=true
echo ""

echo "🔎 查找关键字: image2d_array_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image2d_array_t' . && found_any=true
echo ""

echo "🔎 查找关键字: image1d_buffer_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'image1d_buffer_t' . && found_any=true
echo ""

echo "🔎 查找关键字: sampler_t"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'sampler_t' . && found_any=true
echo ""

echo "🔎 查找关键字: read_imagef"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'read_imagef' . && found_any=true
echo ""

echo "🔎 查找关键字: read_imagei"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'read_imagei' . && found_any=true
echo ""

echo "🔎 查找关键字: read_imageui"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'read_imageui' . && found_any=true
echo ""

echo "🔎 查找关键字: write_imagef"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'write_imagef' . && found_any=true
echo ""

echo "🔎 查找关键字: write_imagei"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'write_imagei' . && found_any=true
echo ""

echo "🔎 查找关键字: write_imageui"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'write_imageui' . && found_any=true
echo ""

echo "🔎 查找关键字: clCreateImage"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clCreateImage' . && found_any=true
echo ""

echo "🔎 查找关键字: clEnqueueReadImage"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clEnqueueReadImage' . && found_any=true
echo ""

echo "🔎 查找关键字: clEnqueueWriteImage"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clEnqueueWriteImage' . && found_any=true
echo ""

echo "🔎 查找关键字: clEnqueueCopyImage"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clEnqueueCopyImage' . && found_any=true
echo ""

echo "🔎 查找关键字: clEnqueueCopyImageToBuffer"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clEnqueueCopyImageToBuffer' . && found_any=true
echo ""

echo "🔎 查找关键字: clEnqueueCopyBufferToImage"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clEnqueueCopyBufferToImage' . && found_any=true
echo ""

echo "🔎 查找关键字: clGetSupportedImageFormats"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clGetSupportedImageFormats' . && found_any=true
echo ""

echo "🔎 查找关键字: clGetImageInfo"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'clGetImageInfo' . && found_any=true
echo ""

echo "🔎 查找关键字: CL_MEM_OBJECT_IMAGE1D"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'CL_MEM_OBJECT_IMAGE1D' . && found_any=true
echo ""

echo "🔎 查找关键字: CL_MEM_OBJECT_IMAGE2D"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'CL_MEM_OBJECT_IMAGE2D' . && found_any=true
echo ""

echo "🔎 查找关键字: CL_MEM_OBJECT_IMAGE3D"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'CL_MEM_OBJECT_IMAGE3D' . && found_any=true
echo ""

echo "🔎 查找关键字: CL_DEVICE_IMAGE_SUPPORT"
grep -rnI --include="*.c" --include="*.cc" --include="*.cpp" --include="*.cl" --include="*.h" 'CL_DEVICE_IMAGE_SUPPORT' . && found_any=true
echo ""

if ! $found_any; then
  echo "✅ 没有发现任何图像相关 API 使用。"
fi
