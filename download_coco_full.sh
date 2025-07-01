#!/bin/bash
set -e

# 进入图像目录
cd ~/Desktop/ai/yolo/yolov5-master/datasets/coco/images || exit

# 定义下载链接
declare -A urls=(
  ["train2017.zip"]="http://images.cocodataset.org/zips/train2017.zip"
  ["val2017.zip"]="http://images.cocodataset.org/zips/val2017.zip"
  ["test2017.zip"]="http://images.cocodataset.org/zips/test2017.zip"
)

# 下载和解压图像
for zip_name in "${!urls[@]}"; do
  url=${urls[$zip_name]}
  echo "📥 Downloading $zip_name..."
  wget -c "$url" -O "$zip_name"

  echo "📦 Unzipping $zip_name..."
  unzip -n "$zip_name" && echo "✅ $zip_name unzipped"
done

# 下载 labels
cd ..
echo "📥 Downloading coco2017labels.zip..."
wget -c https://github.com/ultralytics/assets/releases/download/v0.0.0/coco2017labels.zip
unzip -n coco2017labels.zip

echo "🎉 All COCO data ready!"
