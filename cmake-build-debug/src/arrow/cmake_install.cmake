# Install script for directory: /home/jeff/github/gottingen/titan-arrow/src/arrow

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
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so.17.1.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so.17"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/debug/libarrow.so.17.1.0"
    "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/debug/libarrow.so.17"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so.17.1.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so.17"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/debug/libarrow.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarrow.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/debug/libarrow.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake_modules/FindArrow.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow/ArrowTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow/ArrowTargets.cmake"
         "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/CMakeFiles/Export/b19aa08fc4838d978d887c9596797f66/ArrowTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow/ArrowTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow/ArrowTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/CMakeFiles/Export/b19aa08fc4838d978d887c9596797f66/ArrowTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/CMakeFiles/Export/b19aa08fc4838d978d887c9596797f66/ArrowTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/ArrowConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/ArrowConfigVersion.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/arrow.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/arrow" TYPE FILE FILES
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/api.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/array.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/buffer.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/buffer_builder.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/builder.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/compare.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/device.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/extension_type.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/memory_pool.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/memory_pool_test.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/pch.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/pretty_print.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/record_batch.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/result.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/scalar.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/sparse_tensor.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/status.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/stl.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/stl_allocator.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/table.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/table_builder.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/tensor.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/type.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/type_fwd.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/type_traits.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/visitor.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/visitor_inline.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/ArrowOptions.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/arrow" TYPE FILE FILES "/home/jeff/github/gottingen/titan-arrow/src/arrow/arrow-config.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/testing/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/array/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/c/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/io/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/util/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/vendored/cmake_install.cmake")
  include("/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/src/arrow/ipc/cmake_install.cmake")

endif()

