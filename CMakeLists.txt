#
#==============================================================================
#
#    file                 : CMakeLists.txt
#    created              : Aug 5 2015
#    copyright            : (C) 2015-2020 Joe Thompson
#    email                : beaglejoe@users.sourceforge.net
#    version              : $Id: CMakeLists.txt 8107 2022-04-20 14:10:06Z beaglejoe $
#
#==============================================================================
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#==============================================================================
#
# (hashtag) starts a comment
cmake_minimum_required(VERSION 3.4.0 FATAL_ERROR)

project(3rdParty VERSION 2.2.4)

include(ExternalProject)
include(CMakeDependentOption)

include(thirdpartydefinitions.cmake)

message(STATUS "CMAKE_VERSION = ${CMAKE_VERSION}")
# Setup some defualts...

# Setup the configuration
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
    message(STATUS "No CMAKE_BUILD_TYPE specified, defaulting to ${CMAKE_BUILD_TYPE}")
endif(NOT CMAKE_BUILD_TYPE)

# Setup the install prefix.
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "./installed" CACHE PATH "Prefix prepended to install directories" FORCE)
endif(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)


if(MINGW)
   link_directories(/usr/lib /usr/local/lib)
   include_directories(AFTER /usr/include /usr/local/include)
endif(MINGW)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

set(EXTERNALS_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/deps" CACHE PATH "")
set(EXTERNALS_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/3rdParty" CACHE PATH "")
set(EXTERNALS_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNALS_INSTALL_DIR} CACHE PATH "")

# Need to pass CMAKE_SYSTEM_VERSION to all the projects for the case
# where build is targeting newer system than the build host
if(CMAKE_SYSTEM_VERSION)
   list(APPEND EXTERNALS_CMAKE_ARGS "-DCMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION}")
endif(CMAKE_SYSTEM_VERSION)

if(WIN32)
   set(_max_ext_path "64")
   string(LENGTH ${EXTERNALS_PREFIX} _path_length)
   if(_path_length GREATER _max_ext_path)
      message(WARNING "The length of the EXTERNALS_PREFIX (${EXTERNALS_PREFIX}) is possibly too long (${_path_length}) to build OSG")
      if(${CMAKE_SYSTEM_VERSION} LESS 10 )
         message(SEND_ERROR "The length of the EXTERNALS_PREFIX needs to be less than ${_max_ext_path} to build OSG")
      endif()
   endif()
endif()

set_property(DIRECTORY PROPERTY EP_BASE ${EXTERNALS_PREFIX})

option(OPTION_ZLIB "Download and Build zlib" true)
option(OPTION_EXPAT "Download and Build Expat" true)

# CMAKE_BUILD_TYPE does NOT work for Visual Studio or Xcode
# need to switch on configuration somehow
# or limit the choices
if(CMAKE_BUILD_TYPE MATCHES "Debug")
   set(SUPER_BUILD_POSTFIX "d")
else()
   set(SUPER_BUILD_POSTFIX "")
endif()

if(OPTION_EXPAT)
   if(MSVC_VERSION GREATER 1900)
      #disable building unneeded sub projects
      set(EXPAT_ARGS ${EXTERNALS_CMAKE_ARGS} -DEXPAT_BUILD_TESTS=off -DEXPAT_BUILD_EXAMPLES=off -DEXPAT_BUILD_TOOLS=off -DCMAKE_DEBUG_POSTFIX='')
      ExternalProject_Add(${EXPAT_PROJECT}
         DOWNLOAD_NAME ${EXPAT_FILE}
         URL ${EXPAT_URL}
         URL_HASH ${EXPAT_HASH}
         CMAKE_ARGS ${EXPAT_ARGS})
    else()
      message(WARNING "expat versions newer than 2.2.10 need Visual Studio 2017")
      message(WARNING "expat no longer officially supports Visual Studio 2015 and older")
      #disable building unneeded sub projects (they failed with VS2008)
      set(EXPAT_LEGACY_ARGS ${EXTERNALS_CMAKE_ARGS} -DEXPAT_BUILD_TESTS=off -DEXPAT_BUILD_EXAMPLES=off -DEXPAT_BUILD_TOOLS=off -DCMAKE_DEBUG_POSTFIX='')
      ExternalProject_Add(${EXPAT_LEGACY_PROJECT}
         DOWNLOAD_NAME ${EXPAT_LEGACY_FILE}
         URL ${EXPAT_LEGACY_URL}
         URL_HASH ${EXPAT_LEGACY_HASH}
         CMAKE_ARGS ${EXPAT_LEGACY_ARGS})
    endif()
else(OPTION_EXPAT)
   set(EXPAT_PROJECT )
endif(OPTION_EXPAT)

if(OPTION_ZLIB)
   set(ZLIB_PROJECT zlib-1.2.11)
   ExternalProject_Add(${ZLIB_PROJECT}
      DOWNLOAD_NAME ${ZLIB_FILE}
      URL ${ZLIB_URL}
      URL_HASH ${ZLIB_HASH}
      CMAKE_ARGS ${EXTERNALS_CMAKE_ARGS}
      PATCH_COMMAND ${CMAKE_COMMAND} -E remove -f <SOURCE_DIR>/zconf.h)
   ExternalProject_Add_Step(${ZLIB_PROJECT} sd_zlib_remove_dll
      COMMAND "${CMAKE_COMMAND}" -E remove -f ${EXTERNALS_INSTALL_DIR}/bin/zlib${SUPER_BUILD_POSTFIX}.dll
      DEPENDEES install)
   ExternalProject_Add_Step(${ZLIB_PROJECT} sd_zlib_remove_lib
      COMMAND "${CMAKE_COMMAND}" -E remove -f ${EXTERNALS_INSTALL_DIR}/lib/zlib${SUPER_BUILD_POSTFIX}.lib
      DEPENDEES sd_zlib_remove_dll)
   ExternalProject_Add_Step(${ZLIB_PROJECT} sd_zlib_rename_lib
      COMMAND "${CMAKE_COMMAND}" -E rename ${EXTERNALS_INSTALL_DIR}/lib/zlibstatic${SUPER_BUILD_POSTFIX}.lib ${EXTERNALS_INSTALL_DIR}/lib/zlib.lib
      DEPENDEES sd_zlib_remove_lib)
else(OPTION_ZLIB)
   set(ZLIB_PROJECT )
endif(OPTION_ZLIB)




# no-output target, for having some files available in IDEs.
set(DOCSOURCES COPYING LICENSE)

add_custom_target(rootdoc SOURCES ${DOCSOURCES})

file(GLOB_RECURSE _INFO_FILES "${EXTERNALS_PREFIX}/Stamp/*info.txt")

# ========== Installation =============

install(FILES ${_INFO_FILES} DESTINATION ${EXTERNALS_INSTALL_DIR}/source_info)

install(FILES ${DOCSOURCES} DESTINATION ${EXTERNALS_INSTALL_DIR})

install(DIRECTORY Licenses/ DESTINATION ${EXTERNALS_INSTALL_DIR}/Licenses)

install(DIRECTORY ${EXTERNALS_INSTALL_DIR} DESTINATION .)


# ========== Packaging =============
if(MSVC)
   string(MAKE_C_IDENTIFIER ${CMAKE_GENERATOR} _TMP_NAME)
   string(FIND ${_TMP_NAME} "_" _INDEX REVERSE)
   MATH(EXPR _INDEX "${_INDEX}+1")
   string(SUBSTRING ${_TMP_NAME} ${_INDEX} -1 _VSYEAR)

   # This is now preferrred way to check 32 vs 64 bit
   if(CMAKE_SIZEOF_VOID_P EQUAL 8 ) 
      set(SD_PACKAGE_FILE_NAME ${PROJECT_NAME}-${PROJECT_VERSION}-vs${_VSYEAR}-win64)
   else(CMAKE_SIZEOF_VOID_P EQUAL 8 )
      set(SD_PACKAGE_FILE_NAME ${PROJECT_NAME}-${PROJECT_VERSION}-vs${_VSYEAR}-win32)
   endif(CMAKE_SIZEOF_VOID_P EQUAL 8 )
else(MSVC)
   set(SD_PACKAGE_FILE_NAME ${PROJECT_NAME}-${PROJECT_VERSION}-${CMAKE_C_COMPILER_ID}-${CMAKE_C_COMPILER_VERSION})
endif(MSVC)

# If this is NOT a Release build, append the build type to the filename
string(TOLOWER "${CMAKE_BUILD_TYPE}" _CMAKE_BUILD_TYPE_LOWCASE)
if(NOT _CMAKE_BUILD_TYPE_LOWCASE STREQUAL "release")
   set(SD_PACKAGE_FILE_NAME ${SD_PACKAGE_FILE_NAME}-${CMAKE_BUILD_TYPE})
endif()

#set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY OFF)
set(CPACK_PACKAGE_FILE_NAME ${SD_PACKAGE_FILE_NAME} CACHE STRING "")

message(STATUS "CPACK_PACKAGE_FILE_NAME = ${CPACK_PACKAGE_FILE_NAME}")

set(CPACK_GENERATOR "ZIP")

include(CPack)
