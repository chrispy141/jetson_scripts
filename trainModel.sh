#!/bin/bash

SD_PATH=/jetson-inference/python/training/detection/ssd

cd ${SD_PATH}

#TODO: add data set
python3 train_ssd.py --dataset-type=voc --data=data/<YOUR-DATASET> --model-dir=models/scripted



python3 onnx_export.py --model-dir=models/scripted
