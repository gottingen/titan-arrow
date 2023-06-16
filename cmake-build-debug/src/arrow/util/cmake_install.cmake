# Install script for directory: /home/jeff/github/gottingen/titan-arrow/src/arrow/util

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "DEBUG")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/arrow/util" TYPE FILE FILES
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/align_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/atomic_shared_ptr.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/base64.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/basic_decimal.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/bit_stream_utils.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/bit_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/bpacking.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/bpacking_avx512_generated.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/bpacking_default.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/byte_stream_split.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/checked_cast.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/compare.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/compiler_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/compression.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/cpu_info.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/decimal.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/delimiting.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/double_conversion.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/formatting.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/functional.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/future.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/future_iterator.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/hash_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/hashing.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/int_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/io_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/iterator.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/key_value_metadata.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/logging.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/macros.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/make_unique.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/memory.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/neon_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/optional.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/parallel.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/parsing.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/print.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/range.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/rle_encoding.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/sort.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/sse_util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/stopwatch.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/string.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/string_builder.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/string_view.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/task_group.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/thread_pool.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/time.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/trie.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/type_traits.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/ubsan.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/uri.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/utf8.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/variant.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/vector.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/visibility.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/windows_compatibility.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/util/windows_fixup.h"
    )
endif()

