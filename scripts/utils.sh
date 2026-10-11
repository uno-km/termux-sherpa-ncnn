#!/bin/bash
# Copyright (c) 2026 Uno Kim / AMEVA Foundation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0 OR Commercial-License

default='\033[0m'
bold='\033[1m'
red='\033[31m'
green='\033[32m'

function ok() {
  printf "${bold}${green}[OK]${default} $1\n"
}

function error() {
  printf "${bold}${red}[FAILED]${default} $1\n"
}

function abort() {
  printf "${bold}${red}[FAILED]${default} $1\n"
  exit 1
}
