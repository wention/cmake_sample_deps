cmake_minimum_required(VERSION 3.10)
project(PROJECT_DEPS)

if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
endif()

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(ExternalProject)

set(DEPS_INSTALL_DIR "${CMAKE_BINARY_DIR}")
set(DEPS_BIN_DIR "${DEPS_INSTALL_DIR}/bin")
set(DEPS_LIB_DIR "${DEPS_INSTALL_DIR}/lib")
set(DEPS_BUILD_DIR "${CMAKE_BINARY_DIR}/build")
set(DEPS_DOWNLOAD_DIR "${DEPS_BUILD_DIR}/downloads")

set_directory_properties(PROPERTIES EP_PREFIX "${DEPS_BUILD_DIR}")

message(STATUS "cmake.deps CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")
message(STATUS "DEPS_INSTALL_DIR: ${DEPS_INSTALL_DIR}")
message(STATUS "DEPS_BIN_DIR: ${DEPS_BIN_DIR}")
message(STATUS "DEPS_LIB_DIR: ${DEPS_LIB_DIR}")
message(STATUS "DEPS_BUILD_DIR: ${DEPS_BUILD_DIR}")
message(STATUS "DEPS_DOWNLOAD_DIR: ${DEPS_DOWNLOAD_DIR}")

include(BuildLuajit)
include(buildFreeglut)
