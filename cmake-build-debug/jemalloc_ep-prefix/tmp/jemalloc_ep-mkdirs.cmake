# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep-build"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/tmp"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep-stamp"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src"
  "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/jeff/github/gottingen/titan-arrow/cmake-build-debug/jemalloc_ep-prefix/src/jemalloc_ep-stamp${cfgdir}") # cfgdir has leading slash
endif()
