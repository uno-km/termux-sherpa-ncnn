#!/usr/bin/env bash
# Copyright (c) 2026 Uno Kim / AMEVA Foundation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0 OR Commercial-License

set -e

mkdir -p build
cd build

cmake \
  -D BUILD_SHARED_LIBS=ON \
  -D SHERPA_NCNN_ENABLE_JNI=ON \
  -D SHERPA_NCNN_ENABLE_PORTAUDIO=OFF \
  -D SHERPA_NCNN_ENABLE_PYTHON=OFF \
  -D SHERPA_NCNN_ENABLE_JNI=ON \
  ..

make -j4
ls -lh lib

cd ..

export LD_LIBRARY_PATH=$PWD/build/lib:$LD_LIBRARY_PATH

cd .github/scripts/

git lfs install
git clone https://huggingface.co/csukuangfj/sherpa-ncnn-conv-emformer-transducer-2022-12-06

kotlinc-jvm -include-runtime -d main.jar Main.kt WaveReader.kt SherpaNcnn.kt AssetManager.kt

java -Djava.library.path=../../build/lib -jar main.jar
