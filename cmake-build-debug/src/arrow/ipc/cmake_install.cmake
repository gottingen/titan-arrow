# Install script for directory: /home/jeff/github/gottingen/titan-arrow/src/arrow/ipc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/arrow/ipc" TYPE FILE FILES
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/api.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/dictionary.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/feather.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/json_integration.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/json_simple.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/message.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/options.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/reader.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/test_common.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/util.h"
    "/home/jeff/github/gottingen/titan-arrow/src/arrow/ipc/writer.h"
    )
endif()

