#!/bin/bash
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/arm-linux-gnueabihf.cmake ..
make -j4
