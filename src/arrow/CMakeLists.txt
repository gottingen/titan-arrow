# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

add_custom_target(arrow-all)
add_custom_target(arrow)
add_custom_target(arrow-benchmarks)
add_custom_target(arrow-tests)
add_custom_target(arrow-integration)
add_dependencies(arrow-all
                 arrow
                 arrow-tests
                 arrow-benchmarks
                 arrow-integration)

# Adding unit tests part of the "arrow" portion of the test suite
function(ADD_ARROW_TEST REL_TEST_NAME)
  set(options)
  set(one_value_args PREFIX)
  set(multi_value_args LABELS PRECOMPILED_HEADERS)
  cmake_parse_arguments(ARG
                        "${options}"
                        "${one_value_args}"
                        "${multi_value_args}"
                        ${ARGN})

  if(ARG_PREFIX)
    set(PREFIX ${ARG_PREFIX})
  else()
    set(PREFIX "arrow")
  endif()

  if(ARG_LABELS)
    set(LABELS ${ARG_LABELS})
  else()
    set(LABELS "arrow-tests")
  endif()

  # Because of https://gitlab.kitware.com/cmake/cmake/issues/20289,
  # we must generate the precompiled header on an executable target.
  # Do that on the first unit test target (here "arrow-array-test")
  # and reuse the PCH for the other tests.
  if(ARG_PRECOMPILED_HEADERS)
    set(PCH_ARGS PRECOMPILED_HEADERS ${ARG_PRECOMPILED_HEADERS})
  else()
    set(PCH_ARGS PRECOMPILED_HEADER_LIB "arrow-array-test")
  endif()

  add_test_case(${REL_TEST_NAME}
                PREFIX
                ${PREFIX}
                LABELS
                ${LABELS}
                ${PCH_ARGS}
                ${ARG_UNPARSED_ARGUMENTS})
endfunction()

function(ADD_ARROW_FUZZ_TARGET REL_FUZZING_NAME)
  set(options)
  set(one_value_args PREFIX)
  set(multi_value_args)
  cmake_parse_arguments(ARG
                        "${options}"
                        "${one_value_args}"
                        "${multi_value_args}"
                        ${ARGN})

  if(ARG_PREFIX)
    set(PREFIX ${ARG_PREFIX})
  else()
    set(PREFIX "arrow")
  endif()

  if(ARROW_BUILD_STATIC)
    set(LINK_LIBS arrow_static)
  else()
    set(LINK_LIBS arrow_shared)
  endif()
  add_fuzz_target(${REL_FUZZING_NAME}
                  PREFIX
                  ${PREFIX}
                  LINK_LIBS
                  ${LINK_LIBS}
                  ${ARG_UNPARSED_ARGUMENTS})
endfunction()

function(ADD_ARROW_BENCHMARK REL_TEST_NAME)
  set(options)
  set(one_value_args PREFIX)
  set(multi_value_args)
  cmake_parse_arguments(ARG
                        "${options}"
                        "${one_value_args}"
                        "${multi_value_args}"
                        ${ARGN})
  if(ARG_PREFIX)
    set(PREFIX ${ARG_PREFIX})
  else()
    set(PREFIX "arrow")
  endif()
  add_benchmark(${REL_TEST_NAME}
                PREFIX
                ${PREFIX}
                LABELS
                "arrow-benchmarks"
                ${ARG_UNPARSED_ARGUMENTS})
endfunction()

set(ARROW_SRCS
    array.cc
    builder.cc
    array/builder_adaptive.cc
    array/builder_base.cc
    array/builder_binary.cc
    array/builder_decimal.cc
    array/builder_dict.cc
    array/builder_nested.cc
    array/builder_primitive.cc
    array/builder_union.cc
    array/concatenate.cc
    array/dict_internal.cc
    array/diff.cc
    array/validate.cc
    buffer.cc
    compare.cc
    device.cc
    extension_type.cc
    memory_pool.cc
    pretty_print.cc
    record_batch.cc
    result.cc
    scalar.cc
    sparse_tensor.cc
    status.cc
    table.cc
    table_builder.cc
    tensor.cc
    tensor/coo_converter.cc
    tensor/csc_converter.cc
    tensor/csf_converter.cc
    tensor/csr_converter.cc
    type.cc
    visitor.cc
    c/bridge.cc
    io/buffered.cc
    io/caching.cc
    io/compressed.cc
    io/file.cc
    io/hdfs.cc
    io/hdfs_internal.cc
    io/interfaces.cc
    io/memory.cc
    io/slow.cc
    testing/util.cc
    util/basic_decimal.cc
    util/bit_util.cc
    util/compression.cc
    util/cpu_info.cc
    util/decimal.cc
    util/delimiting.cc
    util/formatting.cc
    util/future.cc
    util/int_util.cc
    util/io_util.cc
    util/iterator.cc
    util/logging.cc
    util/key_value_metadata.cc
    util/memory.cc
    util/parsing.cc
    util/string.cc
    util/string_builder.cc
    util/task_group.cc
    util/thread_pool.cc
    util/time.cc
    util/trie.cc
    util/uri.cc
    util/utf8.cc
    vendored/base64.cpp
    vendored/datetime/tz.cpp
    vendored/double-conversion/bignum.cc
    vendored/double-conversion/double-conversion.cc
    vendored/double-conversion/bignum-dtoa.cc
    vendored/double-conversion/fast-dtoa.cc
    vendored/double-conversion/cached-powers.cc
    vendored/double-conversion/fixed-dtoa.cc
    vendored/double-conversion/diy-fp.cc
    vendored/double-conversion/strtod.cc)

set(ARROW_C_SRCS
    vendored/uriparser/UriCommon.c
    vendored/uriparser/UriCompare.c
    vendored/uriparser/UriEscape.c
    vendored/uriparser/UriFile.c
    vendored/uriparser/UriIp4Base.c
    vendored/uriparser/UriIp4.c
    vendored/uriparser/UriMemory.c
    vendored/uriparser/UriNormalizeBase.c
    vendored/uriparser/UriNormalize.c
    vendored/uriparser/UriParseBase.c
    vendored/uriparser/UriParse.c
    vendored/uriparser/UriQuery.c
    vendored/uriparser/UriRecompose.c
    vendored/uriparser/UriResolve.c
    vendored/uriparser/UriShorten.c)

set_source_files_properties(vendored/datetime/tz.cpp
                            PROPERTIES
                            SKIP_PRECOMPILE_HEADERS
                            ON
                            SKIP_UNITY_BUILD_INCLUSION
                            ON)

# Disable DLL exports in vendored uriparser library
add_definitions(-DURI_STATIC_BUILD)

if(ARROW_WITH_BROTLI)
  add_definitions(-DARROW_WITH_BROTLI)
  list(APPEND ARROW_SRCS util/compression_brotli.cc)
endif()

if(ARROW_WITH_BZ2)
  add_definitions(-DARROW_WITH_BZ2)
  list(APPEND ARROW_SRCS util/compression_bz2.cc)
endif()

if(ARROW_WITH_LZ4)
  add_definitions(-DARROW_WITH_LZ4)
  list(APPEND ARROW_SRCS util/compression_lz4.cc)
endif()

if(ARROW_WITH_SNAPPY)
  add_definitions(-DARROW_WITH_SNAPPY)
  list(APPEND ARROW_SRCS util/compression_snappy.cc)
endif()

if(ARROW_WITH_ZLIB)
  add_definitions(-DARROW_WITH_ZLIB)
  list(APPEND ARROW_SRCS util/compression_zlib.cc)
endif()

if(ARROW_WITH_ZSTD)
  add_definitions(-DARROW_WITH_ZSTD)
  list(APPEND ARROW_SRCS util/compression_zstd.cc)
endif()

set(ARROW_TESTING_SRCS
    io/test_common.cc
    ipc/test_common.cc
    testing/gtest_util.cc
    testing/random.cc
    testing/generator.cc)

# Add dependencies for third-party allocators.
# If possible we only want memory_pool.cc to wait for allocators to finish building,
# but that only works with Ninja
# (see https://gitlab.kitware.com/cmake/cmake/issues/19677)

set(_allocator_dependencies "") # Empty list
if(ARROW_JEMALLOC)
  list(APPEND _allocator_dependencies jemalloc_ep)
endif()
if(ARROW_MIMALLOC)
  list(APPEND _allocator_dependencies mimalloc_ep)
endif()

if(_allocator_dependencies)
  if("${CMAKE_GENERATOR}" STREQUAL "Ninja")
    set_source_files_properties(memory_pool.cc PROPERTIES OBJECT_DEPENDS
                                "${_allocator_dependencies}")
  else()
    add_dependencies(arrow_dependencies ${_allocator_dependencies})
  endif()
  set_source_files_properties(memory_pool.cc
                              PROPERTIES
                              SKIP_PRECOMPILE_HEADERS
                              ON
                              SKIP_UNITY_BUILD_INCLUSION
                              ON)
endif()

unset(_allocator_dependencies)

if(CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  set_property(SOURCE util/io_util.cc
               APPEND_STRING
               PROPERTY COMPILE_FLAGS " -Wno-unused-macros ")
endif()

#
# Configure the base Arrow libraries
#

if(ARROW_CSV)
  list(APPEND ARROW_SRCS
              csv/converter.cc
              csv/chunker.cc
              csv/column_builder.cc
              csv/column_decoder.cc
              csv/options.cc
              csv/parser.cc
              csv/reader.cc)

  list(APPEND ARROW_TESTING_SRCS csv/test_common.cc)
endif()

if(ARROW_COMPUTE)
  list(APPEND ARROW_SRCS
              compute/context.cc
              compute/expression.cc
              compute/logical_type.cc
              compute/operation.cc
              compute/kernels/aggregate.cc
              compute/kernels/boolean.cc
              compute/kernels/cast.cc
              compute/kernels/compare.cc
              compute/kernels/count.cc
              compute/kernels/hash.cc
              compute/kernels/filter.cc
              compute/kernels/mean.cc
              compute/kernels/minmax.cc
              compute/kernels/sort_to_indices.cc
              compute/kernels/nth_to_indices.cc
              compute/kernels/sum.cc
              compute/kernels/add.cc
              compute/kernels/take.cc
              compute/kernels/isin.cc
              compute/kernels/match.cc
              compute/kernels/util_internal.cc
              compute/operations/cast.cc
              compute/operations/literal.cc)
endif()

if(ARROW_FILESYSTEM)
  if(ARROW_HDFS)
    add_definitions(-DARROW_HDFS)
  endif()
  if(ARROW_S3)
    add_definitions(-DARROW_S3)
  endif()

  list(APPEND ARROW_SRCS
              filesystem/filesystem.cc
              filesystem/localfs.cc
              filesystem/mockfs.cc
              filesystem/path_forest.cc
              filesystem/path_util.cc
              filesystem/util_internal.cc)

  if(ARROW_HDFS)
    list(APPEND ARROW_SRCS filesystem/hdfs.cc)
  endif()
  if(ARROW_S3)
    list(APPEND ARROW_SRCS filesystem/s3fs.cc)
    set_source_files_properties(filesystem/s3fs.cc
                                PROPERTIES
                                SKIP_PRECOMPILE_HEADERS
                                ON
                                SKIP_UNITY_BUILD_INCLUSION
                                ON)
  endif()

  list(APPEND ARROW_TESTING_SRCS filesystem/test_util.cc)
endif()

if(ARROW_IPC)
  list(APPEND ARROW_SRCS
              ipc/dictionary.cc
              ipc/feather.cc
              ipc/message.cc
              ipc/metadata_internal.cc
              ipc/options.cc
              ipc/reader.cc
              ipc/writer.cc)

  if(ARROW_JSON)
    list(
      APPEND ARROW_SRCS ipc/json_integration.cc ipc/json_internal.cc ipc/json_simple.cc)
  endif()
endif()

if(ARROW_JSON)
  list(APPEND ARROW_SRCS
              json/options.cc
              json/chunked_builder.cc
              json/chunker.cc
              json/converter.cc
              json/parser.cc
              json/reader.cc)
endif()


if(NOT APPLE AND NOT MSVC)
  # Localize thirdparty symbols using a linker version script. This hides them
  # from the client application. The OS X linker does not support the
  # version-script option.
  set(ARROW_VERSION_SCRIPT_FLAGS
      "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/symbols.map")
  set(ARROW_SHARED_LINK_FLAGS ${ARROW_VERSION_SCRIPT_FLAGS})
endif()

set(ARROW_ALL_SRCS ${ARROW_SRCS} ${ARROW_C_SRCS})

add_arrow_lib(arrow
              CMAKE_PACKAGE_NAME
              Arrow
              PKG_CONFIG_NAME
              arrow
              SOURCES
              ${ARROW_ALL_SRCS}
              OUTPUTS
              ARROW_LIBRARIES
              PRECOMPILED_HEADERS
              "$<$<COMPILE_LANGUAGE:CXX>:arrow/pch.h>"
              DEPENDENCIES
              arrow_dependencies
              SHARED_LINK_FLAGS
              ${ARROW_SHARED_LINK_FLAGS}
              SHARED_LINK_LIBS
              ${ARROW_LINK_LIBS}
              SHARED_PRIVATE_LINK_LIBS
              ${ARROW_SHARED_PRIVATE_LINK_LIBS}
              STATIC_LINK_LIBS
              ${ARROW_STATIC_LINK_LIBS}
              SHARED_INSTALL_INTERFACE_LIBS
              ${ARROW_SHARED_INSTALL_INTERFACE_LIBS}
              STATIC_INSTALL_INTERFACE_LIBS
              ${ARROW_STATIC_INSTALL_INTERFACE_LIBS})

add_dependencies(arrow ${ARROW_LIBRARIES})

if(ARROW_BUILD_STATIC AND WIN32)
  target_compile_definitions(arrow_static PUBLIC ARROW_STATIC)
endif()

if(ARROW_BUILD_TESTS
   OR ARROW_BUILD_BENCHMARKS
   OR ARROW_BUILD_INTEGRATION
   OR ARROW_FUZZING)

  # that depend on gtest
  add_arrow_lib(arrow_testing
                CMAKE_PACKAGE_NAME
                ArrowTesting
                PKG_CONFIG_NAME
                arrow-testing
                SOURCES
                ${ARROW_TESTING_SRCS}
                OUTPUTS
                ARROW_TESTING_LIBRARIES
                PRECOMPILED_HEADERS
                "$<$<COMPILE_LANGUAGE:CXX>:arrow/pch.h>"
                DEPENDENCIES
                arrow_test_dependencies
                SHARED_LINK_LIBS
                arrow_shared
                GTest::gtest
                STATIC_LINK_LIBS
                arrow_static)

  add_custom_target(arrow_testing)
  add_dependencies(arrow_testing ${ARROW_TESTING_LIBRARIES})

  if(ARROW_BUILD_STATIC AND WIN32)
    target_compile_definitions(arrow_testing_static PUBLIC ARROW_STATIC)
  endif()

  set(ARROW_LIBRARIES ${ARROW_LIBRARIES} ${ARROW_TESTING_LIBRARIES})
endif()

if(ARROW_WITH_BACKTRACE)
  find_package(Backtrace)

  foreach(LIB_TARGET ${ARROW_LIBRARIES})
    target_compile_definitions(${LIB_TARGET} PRIVATE ARROW_EXPORTING)
    if(Backtrace_FOUND AND ARROW_WITH_BACKTRACE)
      target_compile_definitions(${LIB_TARGET} PRIVATE ARROW_WITH_BACKTRACE)
    endif()
  endforeach()
endif()

arrow_install_all_headers("arrow")

config_summary_cmake_setters("${CMAKE_CURRENT_BINARY_DIR}/ArrowOptions.cmake")
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/ArrowOptions.cmake
        DESTINATION "${ARROW_CMAKE_INSTALL_DIR}")

# For backward compatibility for find_package(arrow)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/arrow-config.cmake
        DESTINATION "${ARROW_CMAKE_INSTALL_DIR}")

#
# Unit tests
#

add_arrow_test(array_test
               SOURCES
               array_test.cc
               array_binary_test.cc
               array_dict_test.cc
               array_list_test.cc
               array_struct_test.cc
               array_union_test.cc
               array_view_test.cc
               PRECOMPILED_HEADERS
               "$<$<COMPILE_LANGUAGE:CXX>:arrow/testing/pch.h>")
add_arrow_test(buffer_test)

if(ARROW_IPC)
  # The extension type unit tests require IPC / Flatbuffers support
  add_arrow_test(extension_type_test)
endif()

add_arrow_test(misc_test
               SOURCES
               memory_pool_test.cc
               result_test.cc
               pretty_print_test.cc
               status_test.cc)

add_arrow_test(public_api_test)

set_source_files_properties(public_api_test.cc
                            PROPERTIES
                            SKIP_PRECOMPILE_HEADERS
                            ON
                            SKIP_UNITY_BUILD_INCLUSION
                            ON)

add_arrow_test(scalar_test)
add_arrow_test(type_test)

add_arrow_test(table_test SOURCES table_test.cc table_builder_test.cc)

add_arrow_test(tensor_test)
add_arrow_test(sparse_tensor_test)

if(ARROW_COMPUTE)
  # This unit test uses compute code
  add_arrow_test(stl_test)
endif()

add_arrow_benchmark(builder_benchmark)
add_arrow_benchmark(type_benchmark)

#
# Recurse into sub-directories
#

# Unconditionally install testing headers that are also useful for Arrow consumers.
add_subdirectory(testing)

add_subdirectory(array)
add_subdirectory(c)
add_subdirectory(io)
add_subdirectory(util)
add_subdirectory(vendored)

if(ARROW_CSV)
  add_subdirectory(csv)
endif()

if(ARROW_COMPUTE)
  add_subdirectory(compute)
endif()

if(ARROW_CUDA)
  add_subdirectory(gpu)
endif()

if(ARROW_DATASET)
  add_subdirectory(dataset)
endif()

if(ARROW_FILESYSTEM)
  add_subdirectory(filesystem)
endif()

if(ARROW_FLIGHT)
  add_subdirectory(flight)
endif()

if(ARROW_HIVESERVER2)
  add_subdirectory(dbi/hiveserver2)
endif()

if(ARROW_IPC)
  add_subdirectory(ipc)
endif()

if(ARROW_JSON)
  add_subdirectory(json)
endif()


if(ARROW_PYTHON)
  add_subdirectory(python)
endif()

if(ARROW_TENSORFLOW)
  add_subdirectory(adapters/tensorflow)
endif()
