##  Copyright (c) 2017 The WebM project authors. All Rights Reserved.
##
##  Use of this source code is governed by a BSD-style license
##  that can be found in the LICENSE file in the root of the source
##  tree. An additional intellectual property rights grant can be found
##  in the file PATENTS.  All contributing project authors may
##  be found in the AUTHORS file in the root of the source tree.
set(CMAKE_SYSTEM_PROCESSOR "arm")
set(CMAKE_SYSTEM_NAME "Linux")

set(tools /home/vdi/Android/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf)
set(CROSS arm-linux-gnueabihf-)

set(CMAKE_C_COMPILER ${tools}/bin/${CROSS}gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/${CROSS}g++)

