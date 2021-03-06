# Copyright (c) 2015-2016, Graphics Lab, Georgia Tech Research Corporation
# Copyright (c) 2015-2016, Humanoid Lab, Georgia Tech Research Corporation
# Copyright (c) 2016, Personal Robotics Lab, Carnegie Mellon University
# This file is provided under the "BSD-style" License

# Find ASSIMP
#
# This sets the following variables:
# ASSIMP_FOUND
# ASSIMP_INCLUDE_DIRS
# ASSIMP_LIBRARIES
# ASSIMP_VERSION

find_package(PkgConfig QUIET)

# Check to see if pkgconfig is installed.
pkg_check_modules(PC_ASSIMP assimp QUIET)

# Include directories
find_path(ASSIMP_INCLUDE_DIRS assimp/scene.h
    HINTS ${PC_ASSIMP_INCLUDEDIR}
    PATHS "${CMAKE_INSTALL_PREFIX}/include")

# Libraries
if(MSVC)
  set(ASSIMP_LIBRARIES optimized assimp debug assimpd)
else()
  find_library(ASSIMP_LIBRARIES
      NAMES assimp
      HINTS ${PC_ASSIMP_LIBDIR})
endif()

# Version
set(ASSIMP_VERSION ${PC_ASSIMP_VERSION})

# Set (NAME)_FOUND if all the variables and the version are satisfied.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ASSIMP
    FAIL_MESSAGE  DEFAULT_MSG
    REQUIRED_VARS ASSIMP_INCLUDE_DIRS ASSIMP_LIBRARIES
    VERSION_VAR   ASSIMP_VERSION)

