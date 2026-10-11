#!/usr/bin/env bash
# Copyright (c) 2026 Uno Kim / AMEVA Foundation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0 OR Commercial-License

set -e

log() {
  # This function is from espnet
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%d %H:%M:%S') (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $*"
}

echo "EXE is $EXE"
echo "PATH: $PATH"

which $EXE

cd build

curl -SL -O https://github.com/k2-fsa/sherpa-ncnn/releases/download/models/sherpa-ncnn-silero-vad.tar.bz2
tar xvf sherpa-ncnn-silero-vad.tar.bz2
rm sherpa-ncnn-silero-vad.tar.bz2
ls -lh sherpa-ncnn-silero-vad

curl -SL -O https://github.com/k2-fsa/sherpa-ncnn/releases/download/models/lei-jun-test.wav

$EXE

ls -lh *.wav
rm -rfv sherpa-ncnn-*
rm *.wav
