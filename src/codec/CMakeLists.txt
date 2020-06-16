SET (TARGET_NAME "rfxcodec")
SET (PROJECT_INC ${CMAKE_SOURCE_DIR}/inc)
INCLUDE_DIRECTORIES (${PROJECT_INC})
#AUX_SOURCE_DIRECTORY (. SRC_FILES)
AUX_SOURCE_DIRECTORY (primitives PRI_FILES)
SET (WINPR_LIB  ${PROJECT_SOURCE_DIR}/output)
LINK_DIRECTORIES (${WINPR_LIB})

SET(ENV{PKG_CONFIG_PATH} /home/vdi/hc/openssl/lib/pkgconfig)
find_package(PkgConfig)
pkg_search_module(OPENSSL openssl)

SET (OPENSSL_LIB /home/vdi/hc/openssl/lib)

set(CODEC_SRCS
    color.c
    rfx_bitstream.h
    rfx_constants.h
    rfx_decode.c
    rfx_decode.h
    rfx_differential.h
    rfx_dwt.c
    rfx_dwt.h
    rfx_encode.c
    rfx_encode.h
    rfx_quantization.c
    rfx_quantization.h
    rfx_rlgr.c
    rfx_rlgr.h
    rfx_types.h
    rfx.c
    region.c)
	
set(CODEC_SSE2_SRCS
    rfx_sse2.c
    rfx_sse2.h)

set(CODEC_NEON_SRCS
    rfx_neon.c
    rfx_neon.h)

#set_source_files_properties(${CODEC_SSE2_SRCS} PROPERTIES COMPILE_FLAGS "-msse2" )
#set(CODEC_SRCS ${CODEC_SRCS} ${CODEC_SSE2_SRCS})

set_source_files_properties(${CODEC_SSE2_SRCS} PROPERTIES COMPILE_FLAGS "-mfpu=neon" )
set(CODEC_SRCS ${CODEC_SRCS} ${CODEC_NEON_SRCS})

LINK_DIRECTORIES (${OPENSSL_LIB})
add_definitions(-DFREERDP_EXPORTS)
SET (LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/output)
SET (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
SET (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
ADD_LIBRARY(rfxcodec SHARED ${CODEC_SRCS} ${PRI_FILES})
target_link_libraries(rfxcodec winpr ${OPENSSL_LIBRARIES})

