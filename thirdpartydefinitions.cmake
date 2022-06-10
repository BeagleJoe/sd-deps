#
#==============================================================================
#
#    file                 : thirdpartydefinitions.cmake
#    created              : June 22 2020
#    copyright            : (C) 2020 Joe Thompson
#    email                : beaglejoe@users.sourceforge.net
#    version              : $Id: thirdpartydefinitions.cmake 8066 2022-03-05 15:50:33Z beaglejoe $
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
#
#           NOTICE
# When updating OpenSceneGraph, libPNG, or jpeg
# Check /cmake/customthirdparty.cmake
#  The macros 
#     MACRO(SD_INSTALL_CUSTOM_3RDPARTY TARGET_NAME)
#     MACRO(_FIND_3RDPARTY_DEPENDENCIES ROOT_DIR)
#  may need to be updated for the new version



# expat
set(EXPAT_VERSION 2.4.8)
string(REPLACE "." "_" EXPAT_TAG ${EXPAT_VERSION})
set(EXPAT_PROJECT expat-${EXPAT_VERSION})
set(EXPAT_FILE ${EXPAT_PROJECT}.tar.bz2)
set(EXPAT_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_TAG}/${EXPAT_FILE})
set(EXPAT_HASH SHA256=a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16)

set(EXPAT_LEGACY_VERSION 2.2.10)
string(REPLACE "." "_" EXPAT_LEGACY_TAG ${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_PROJECT expat-${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_FILE ${EXPAT_LEGACY_PROJECT}.tar.bz2)
set(EXPAT_LEGACY_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_LEGACY_TAG}/${EXPAT_LEGACY_FILE})
set(EXPAT_LEGACY_HASH SHA256=b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5)

# zlib
message(STATUS "Note special path handling (version in path)")
set(ZLIB_VERSION 1.2.11)
set(ZLIB_PROJECT zlib-${ZLIB_VERSION})
set(ZLIB_FILE ${ZLIB_PROJECT}.tar.gz)
set(ZLIB_URL https://sourceforge.net/projects/libpng/files/zlib/${ZLIB_VERSION}/${ZLIB_FILE}/download)
set(ZLIB_HASH SHA256=c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1)

