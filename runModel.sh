#!/bin/bash

SD_PATH=/jetson-inference/python/training/detection/ssd
DATA_PATH=${SD_PATH}/data

cd ${SD_PATH}

NET=data/scripted
detectnet --model=$NET/ssd-mobilenet.onnx --labels=$NET/labels.txt \
          --input-blob=input_0 --output-cvg=scores --output-bbox=boxes \
            /dev/video1
