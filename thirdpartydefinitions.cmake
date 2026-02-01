#
#==============================================================================
#
#    file                 : thirdpartydefinitions.cmake
#    created              : June 22 2020
#    copyright            : (C) 2020 Joe Thompson
#    email                : beaglejoe@users.sourceforge.net
#    version              : $Id: thirdpartydefinitions.cmake 9358 2024-03-01 20:30:52Z beaglejoe $
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


# SDL2
set(SDL2_VERSION 2.32.10)
set(SDL2_PROJECT SDL2-${SDL2_VERSION})
set(SDL2_FILE ${SDL2_PROJECT}.tar.gz)
set(SDL2_URL https://www.libsdl.org/release/${SDL2_FILE})
set(SDL2_HASH SHA256=5f5993c530f084535c65a6879e9b26ad441169b3e25d789d83287040a9ca5165)

set(SDL2_LEGACY_VERSION 2.24.2)
set(SDL2_LEGACY_PROJECT SDL2-${SDL2_LEGACY_VERSION})
set(SDL2_LEGACY_FILE ${SDL2_LEGACY_PROJECT}.tar.gz)
set(SDL2_LEGACY_URL https://www.libsdl.org/release/${SDL2_LEGACY_FILE})
set(SDL2_LEGACY_HASH SHA256=b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f)

# SDL2_MIXER
set(SDL2_MIXER_VERSION 2.8.1)
set(SDL2_MIXER_PROJECT SDL2_mixer-${SDL2_MIXER_VERSION})
set(SDL2_MIXER_FILE ${SDL2_MIXER_PROJECT}.tar.gz)
#set(SDL2_MIXER_URL https://www.libsdl.org/projects/SDL_mixer/release/${SDL2_MIXER_FILE})

set(SDL2_MIXER_URL https://github.com/libsdl-org/SDL_mixer/releases/download/release-${SDL2_MIXER_VERSION}/${SDL2_MIXER_FILE})
#https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.6.1/SDL2_mixer-2.6.1.tar.gz
set(SDL2_MIXER_HASH SHA256=cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660)

# OpenAL-soft
set(OPENAL_PROJECT_VERSION 1.25.1)
set(OPENAL_PROJECT openal-soft-${OPENAL_PROJECT_VERSION})
set(OPENAL_FILE ${OPENAL_PROJECT}.tar.gz)
set(OPENAL_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_PROJECT_VERSION}.tar.gz)
set(OPENAL_HASH SHA256=5f8efe8dfba5e9307a50251ba615ace857c7fa9dddfe34130b83e213d7f7cf24)

set(OPENAL_C20_PROJECT_VERSION 1.24.3)
set(OPENAL_C20_PROJECT openal-soft-${OPENAL_C20_PROJECT_VERSION})
set(OPENAL_C20_FILE ${OPENAL_C20_PROJECT}.tar.gz)
set(OPENAL_C20_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_C20_PROJECT_VERSION}.tar.gz)
set(OPENAL_C20_HASH SHA256=7e1fecdeb45e7f78722b776c5cf30bd33934b961d7fd2a11e0494e064cc631ce)

set(OPENAL_C17_PROJECT_VERSION 1.23.1)
set(OPENAL_C17_PROJECT openal-soft-${OPENAL_C17_PROJECT_VERSION})
set(OPENAL_C17_FILE ${OPENAL_C17_PROJECT}.tar.gz)
set(OPENAL_C17_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_C17_PROJECT_VERSION}.tar.gz)
set(OPENAL_C17_HASH SHA256=dfddf3a1f61059853c625b7bb03de8433b455f2f79f89548cbcbd5edca3d4a4a)

# https://github.com/kcat/openal-soft/releases/tag/1.23.1
# https://github.com/kcat/openal-soft/archive/refs/tags/1.23.1.tar.gz

message(WARNING "openal-soft versions newer than 1.19.1 need Visual Studio 2017 and CMAKE_SYSTEM_VERSION >= 10")
set(OPENAL_C11_VERSION 1.19.1)
set(OPENAL_C11_PROJECT openal-soft-${OPENAL_C11_VERSION})
set(OPENAL_C11_FILE ${OPENAL_C11_PROJECT}.tar.gz)
set(OPENAL_C11_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_C11_FILE})
set(OPENAL_C11_HASH SHA256=9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7)

message(STATUS "openal-soft versions newer than 1.18.2 need Visual Studio 2015 or newer")
message(STATUS "so for older versions of Visual Studio, also download this version")
set(OPENAL_LEGACY_VERSION 1.18.2)
set(OPENAL_LEGACY_PROJECT openal-soft-${OPENAL_LEGACY_VERSION})
set(OPENAL_LEGACY_FILE ${OPENAL_LEGACY_PROJECT}.tar.gz)
set(OPENAL_LEGACY_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_LEGACY_FILE})
set(OPENAL_LEGACY_HASH SHA256=a598241d1af2e90c25a1b91da4c9ddc0e7cb6a4b5f1477fc680d139c57cd38cc)

# PLIB
message(STATUS "TODO: Need special handling for PLIB")
message(STATUS "TODO: Switch to the zip file once a download location is setup")
message(STATUS "NOTE: PLIB_HEAD_HASH changes every time a  new zip is generated")
set(PLIB_SVN_REPO svn://svn.code.sf.net/p/plib/code/trunk)
set(PLIB_SVN_REVISION 2173)
set(PLIB_HEAD_VERSION r${PLIB_SVN_REVISION})
set(PLIB_HEAD_PROJECT plib-trunk-${PLIB_HEAD_VERSION})
set(PLIB_HEAD_FILE plib-code-${PLIB_HEAD_VERSION}-trunk.zip)
set(PLIB_HEAD_URL https://sourceforge.net/code-snapshots/svn/p/pl/plib/code/${PLIB_HEAD_FILE})
set(PLIB_HEAD_HASH SHA256=ea55eb715657fc54601c76caabad263140cc0787a33235f3d56e62db186fc177)

set(PLIB_VERSION 1.8.5)
set(PLIB_PROJECT plib-${PLIB_VERSION})
set(PLIB_FILE ${PLIB_PROJECT}.tar.gz)
set(PLIB_URL http://plib.sourceforge.net/dist/${PLIB_FILE})
set(PLIB_HASH SHA256=485b22bf6fdc0da067e34ead5e26f002b76326f6371e2ae006415dea6a380a32)

# jpeg
set(JPEG_VERSION 10)
set(JPEG_PROJECT jpeg-${JPEG_VERSION})
set(JPEG_FILE jpegsrc.v${JPEG_VERSION}.tar.gz)
set(JPEG_URL https://ijg.org/files/${JPEG_FILE})
set(JPEG_HASH SHA256=8b9eaa13242690ebd03e1728ab1edf97a81a78ed6e83624d493655f31ac95ab5)

# freeSOLID
set(FREESOLID_VERSION 2.1.2)
set(FREESOLID_PROJECT FreeSOLID-${FREESOLID_VERSION})
set(FREESOLID_FILE ${FREESOLID_PROJECT}.zip)
set(FREESOLID_URL https://sourceforge.net/projects/freesolid/files/${FREESOLID_FILE}/download)
set(FREESOLID_HASH SHA256=89edc6afdd9d60c8020b2b865b61558c86a8928dc6f1773b9f4708b5c28eb873)

# enet
set(ENET_VERSION 1.3.18)
set(ENET_PROJECT enet-${ENET_VERSION})
set(ENET_FILE ${ENET_PROJECT}.tar.gz)
set(ENET_URL https://github.com/lsalzman/enet/archive/refs/tags/v${ENET_VERSION}.tar.gz)
set(ENET_HASH SHA256=28603c895f9ed24a846478180ee72c7376b39b4bb1287b73877e5eae7d96b0dd)

# ogg
set(OGG_VERSION 1.3.6)
set(OGG_PROJECT ogg-${OGG_VERSION})
set(OGG_FILE lib${OGG_PROJECT}.tar.gz)
set(OGG_URL http://downloads.xiph.org/releases/ogg/${OGG_FILE})
set(OGG_HASH SHA256=83e6704730683d004d20e21b8f7f55dcb3383cdf84c0daedf30bde175f774638)

# vorbis
set(VORBIS_VERSION 1.3.7)
set(VORBIS_PROJECT vorbis-${VORBIS_VERSION})
set(VORBIS_FILE lib${VORBIS_PROJECT}.tar.gz)
set(VORBIS_URL http://downloads.xiph.org/releases/vorbis/${VORBIS_FILE})
set(VORBIS_HASH SHA256=0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab)

# expat
set(EXPAT_VERSION 2.7.4)
string(REPLACE "." "_" EXPAT_TAG ${EXPAT_VERSION})
set(EXPAT_PROJECT expat-${EXPAT_VERSION})
set(EXPAT_FILE ${EXPAT_PROJECT}.tar.bz2)
set(EXPAT_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_TAG}/${EXPAT_FILE})
set(EXPAT_HASH SHA256=e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0)

set(EXPAT_LEGACY_VERSION 2.2.10)
string(REPLACE "." "_" EXPAT_LEGACY_TAG ${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_PROJECT expat-${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_FILE ${EXPAT_LEGACY_PROJECT}.tar.bz2)
set(EXPAT_LEGACY_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_LEGACY_TAG}/${EXPAT_LEGACY_FILE})
set(EXPAT_LEGACY_HASH SHA256=b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5)

# zlib
message(STATUS "Note special path handling (version in path)")
set(ZLIB_VERSION 1.3.1)
set(ZLIB_PROJECT zlib-${ZLIB_VERSION})
set(ZLIB_FILE ${ZLIB_PROJECT}.tar.gz)
#set(ZLIB_URL https://github.com/madler/zlib/releases/download/v${ZLIB_VERSION}/{ZLIB_FILE}.tar.gz)
#set(ZLIB_HASH SHA256=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855)
set(ZLIB_URL https://zlib.net/${ZLIB_FILE})
set(ZLIB_HASH SHA256=9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23)

# libpng
message(STATUS "Note special path handling (version in path) AND hard-coded 'libpng16'")
set(PNG_VERSION 1.6.54)
set(PNG_PROJECT libpng-${PNG_VERSION})
set(PNG_FILE ${PNG_PROJECT}.tar.gz)
#set(PNG_URL https://sourceforge.net/projects/libpng/files/libpng16/${PNG_VERSION}/${PNG_FILE}/download)
set(PNG_URL https://github.com/pnggroup/libpng/archive/refs/tags/v${PNG_VERSION}.tar.gz)
set(PNG_HASH SHA256=ba7efce137409079989df4667706c339bebfbb10e9f413474718012a13c8cd4c)

# freetype
message(STATUS "Note special path handling (version in path) AND hard-coded 'freetype2'")
set(FREETYPE_VERSION 2.14.1)
set(FREETYPE_PROJECT freetype-${FREETYPE_VERSION})
string(REPLACE "." "" FREETYPE_TAG ${FREETYPE_VERSION})
set(FREETYPE_FILE ft${FREETYPE_TAG}.zip)
set(FREETYPE_URL https://sourceforge.net/projects/freetype/files/freetype2/${FREETYPE_VERSION}/${FREETYPE_FILE}/download)
set(FREETYPE_HASH SHA256=517b908b1de5ba9d7a42d8633ac306e9030e2b96f37360bed4f8acc25388083c)

message(STATUS "Note special path handling (version in path) AND hard-coded 'freetype2'")
set(FREETYPE_LEGACY_VERSION 2.10.4)
set(FREETYPE_LEGACY_PROJECT freetype-${FREETYPE_LEGACY_VERSION})
set(FREETYPE_LEGACY_FILE ft2104.zip)
set(FREETYPE_LEGACY_URL https://sourceforge.net/projects/freetype/files/freetype2/${FREETYPE_LEGACY_VERSION}/${FREETYPE_LEGACY_FILE}/download)
set(FREETYPE_LEGACY_HASH SHA256=5c78216d6c5860ef694fde1418d20d69d0ac83ab346c21eb311bd45709e0d93a)

# curl
set(CURL_VERSION 8.18.0)
string(REPLACE "." "_" CURL_TAG ${CURL_VERSION})
set(CURL_PROJECT curl-${CURL_VERSION})
set(CURL_FILE ${CURL_PROJECT}.tar.bz2)
#set(CURL_URL https://curl.se/download/${CURL_FILE})
set(CURL_URL https://github.com/curl/curl/releases/download/curl-${CURL_TAG}/${CURL_FILE})
set(CURL_HASH SHA256=ffd671a3dad424fb68e113a5b9894c5d1b5e13a88c6bdf0d4af6645123b31faf)

# osg
set(OSG_VERSION 3.6.5)
set(OSG_PROJECT OpenSceneGraph-${OSG_VERSION})
set(OSG_FILE ${OSG_PROJECT}.zip)
set(OSG_URL https://github.com/openscenegraph/OpenSceneGraph/archive/${OSG_FILE})
set(OSG_HASH SHA256=0e9e3e4cc6f463f21a901934a95e9264b231a1d5db90f72dcb4b8cc94b0d1b3b)

# sqlite3
message(STATUS "Note the YEAR in the path AND hard-coded filename")
message(STATUS "Change the version in: patches/sqlite3-CMakeLists.txt")
set(SQLITE3_VERSION 3.51.2)
set(SQLITE3_PROJECT sqlite3-${SQLITE3_VERSION})
set(SQLITE3_FILE sqlite-amalgamation-3510200.zip)
set(SQLITE3_URL https://www.sqlite.org/2026/${SQLITE3_FILE})
set(SQLITE3_HASH SHA256=6e2a845a493026bdbad0618b2b5a0cf48584faab47384480ed9f592d912f23ec)

# GLM
set(GLM_VERSION 1.0.3)
set(GLM_PROJECT glm-${GLM_VERSION})
set(GLM_FILE ${GLM_PROJECT},tar.gz)
set(GLM_URL https://github.com/g-truc/glm/archive/refs/tags/${GLM_VERSION}.tar.gz)
set(GLM_HASH SHA256=6775e47231a446fd086d660ecc18bcd076531cfedd912fbd66e576b118607001)

#https://github.com/mosra/corrade/archive/refs/tags/v2020.06.tar.gz
# corrade
set(CORRADE_VERSION 2020.06)
set(CORRADE_PROJECT corrade-${CORRADE_VERSION})
set(CORRADE_FILE corrade-${CORRADE_VERSION}.tar.gz)
set(CORRADE_URL https://github.com/mosra/corrade/archive/refs/tags/v${CORRADE_VERSION}.tar.gz)
set(CORRADE_HASH SHA256=2a62492ccc717422b72f2596a3e1a6a105b9574aa9467917f12d19ef3aab1341)

# magnum
set(MAGNUM_VERSION 2020.06)
set(MAGNUM_PROJECT magnum-${MAGNUM_VERSION})
set(MAGNUM_FILE magnum-${MAGNUM_VERSION}.tar.gz)
set(MAGNUM_URL https://github.com/mosra/magnum/archive/refs/tags/v${MAGNUM_VERSION}.tar.gz)
set(MAGNUM_HASH SHA256=98dfe802e56614e4e6bf750d9b693de46a5ed0c6eb479b0268f1a20bf34268bf)


# libzip
set(LIBZIP_VERSION 1.11.4)
set(LIBZIP_PROJECT libzip-${LIBZIP_VERSION})
set(LIBZIP_FILE ${LIBZIP_PROJECT}.tar.gz)
# SSL issue ?
#set(LIBZIP_URL https://libzip.org/download/${LIBZIP_FILE}) 
set(LIBZIP_URL https://github.com/nih-at/libzip/releases/download/v${LIBZIP_VERSION}/${LIBZIP_FILE})
set(LIBZIP_HASH SHA256=82e9f2f2421f9d7c2466bbc3173cd09595a88ea37db0d559a9d0a2dc60dc722e)

# OpenCL
set(OPENCL_VERSION v2025.07.23)
set(OPENCL_PROJECT OpenCL-SDK-${OPENCL_VERSION})
set(OPENCL_FILE ${OPENCL_PROJECT}-Source.zip)
set(OPENCL_URL https://github.com/KhronosGroup/OpenCL-SDK/releases/download/${OPENCL_VERSION}/${OPENCL_FILE})
set(OPENCL_HASH SHA256=29dc06da27d264d8e8592d0ba3e5d3d3ecefb3394f808e67b70ad3124b291a38)

# VulkanSceneGraph
set(VSG_VERSION 1.1.13)
set(VSG_PROJECT VulkanSceneGraph-${VSG_VERSION})
set(VSG_FILE ${VSG_PROJECT}.tar.gz)
set(VSG_URL https://github.com/vsg-dev/VulkanSceneGraph/archive/refs/tags/v${VSG_VERSION}.tar.gz)
set(VSG_HASH SHA256=653af399405e8a024d3254f9d8862aaaea0ac71ce832a0c09ef5e57d3def2ef3)

# TinyGLTF 
set(TINYGLTF_VERSION 2.9.7)
set(TINYGLTF_PROJECT TinyGLTF-${TINYGLTF_VERSION})
set(TINYGLTF_FILE ${TINYGLTF_PROJECT}.tar.gz)
set(TINYGLTF_URL https://github.com/syoyo/tinygltf/archive/refs/tags/v${TINYGLTF_VERSION}.tar.gz)
set(TINYGLTF_HASH SHA256=9d31cf7f22e81febaf1ad587d7722582c154f7d9125673ee46c0c594765e8f35)
