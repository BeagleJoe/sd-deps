#
#==============================================================================
#
#    file                 : thirdpartydefinitions.cmake
#    created              : June 22 2020
#    copyright            : (C) 2020 Joe Thompson
#    email                : beaglejoe@users.sourceforge.net
#    version              : $Id: thirdpartydefinitions.cmake 9156 2023-09-14 14:30:08Z beaglejoe $
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
set(SDL2_VERSION 2.28.3)
set(SDL2_PROJECT SDL2-${SDL2_VERSION})
set(SDL2_FILE ${SDL2_PROJECT}.tar.gz)
set(SDL2_URL https://www.libsdl.org/release/${SDL2_FILE})
set(SDL2_HASH SHA256=7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518)

set(SDL2_LEGACY_VERSION 2.24.2)
set(SDL2_LEGACY_PROJECT SDL2-${SDL2_LEGACY_VERSION})
set(SDL2_LEGACY_FILE ${SDL2_LEGACY_PROJECT}.tar.gz)
set(SDL2_LEGACY_URL https://www.libsdl.org/release/${SDL2_LEGACY_FILE})
set(SDL2_LEGACY_HASH SHA256=b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f)

# SDL2_MIXER
set(SDL2_MIXER_VERSION 2.6.3)
set(SDL2_MIXER_PROJECT SDL2_mixer-${SDL2_MIXER_VERSION})
set(SDL2_MIXER_FILE ${SDL2_MIXER_PROJECT}.tar.gz)
#set(SDL2_MIXER_URL https://www.libsdl.org/projects/SDL_mixer/release/${SDL2_MIXER_FILE})

set(SDL2_MIXER_URL https://github.com/libsdl-org/SDL_mixer/releases/download/release-${SDL2_MIXER_VERSION}/${SDL2_MIXER_FILE})
#https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.6.1/SDL2_mixer-2.6.1.tar.gz
set(SDL2_MIXER_HASH SHA256=7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f)

# OpenAL-soft
set(OPENAL_PROJECT_VERSION 1.23.1)
set(OPENAL_PROJECT openal-soft-${OPENAL_PROJECT_VERSION})
set(OPENAL_FILE ${OPENAL_PROJECT}.tar.gz)
set(OPENAL_URL https://github.com/kcat/openal-soft/archive/refs/tags/${OPENAL_PROJECT_VERSION}.tar.gz)
set(OPENAL_HASH SHA256=dfddf3a1f61059853c625b7bb03de8433b455f2f79f89548cbcbd5edca3d4a4a)

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
set(JPEG_VERSION 9e)
set(JPEG_PROJECT jpeg-${JPEG_VERSION})
set(JPEG_FILE jpegsrc.v${JPEG_VERSION}.tar.gz)
set(JPEG_URL https://ijg.org/files/${JPEG_FILE})
set(JPEG_HASH SHA256=4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d)

# freeSOLID
set(FREESOLID_VERSION 2.1.2)
set(FREESOLID_PROJECT FreeSOLID-${FREESOLID_VERSION})
set(FREESOLID_FILE ${FREESOLID_PROJECT}.zip)
set(FREESOLID_URL https://sourceforge.net/projects/freesolid/files/${FREESOLID_FILE}/download)
set(FREESOLID_HASH SHA256=89edc6afdd9d60c8020b2b865b61558c86a8928dc6f1773b9f4708b5c28eb873)

# enet
set(ENET_VERSION 1.3.17)
set(ENET_PROJECT enet-${ENET_VERSION})
set(ENET_FILE ${ENET_PROJECT}.tar.gz)
set(ENET_URL https://github.com/lsalzman/enet/archive/refs/tags/v${ENET_VERSION}.tar.gz)
set(ENET_HASH SHA256=1e0b4bc0b7127a2d779dd7928f0b31830f5b3dcb7ec9588c5de70033e8d2434a)

# ogg
set(OGG_VERSION 1.3.5)
set(OGG_PROJECT ogg-${OGG_VERSION})
set(OGG_FILE lib${OGG_PROJECT}.tar.gz)
set(OGG_URL http://downloads.xiph.org/releases/ogg/${OGG_FILE})
set(OGG_HASH SHA256=0eb4b4b9420a0f51db142ba3f9c64b333f826532dc0f48c6410ae51f4799b664)

# vorbis
set(VORBIS_VERSION 1.3.7)
set(VORBIS_PROJECT vorbis-${VORBIS_VERSION})
set(VORBIS_FILE lib${VORBIS_PROJECT}.tar.gz)
set(VORBIS_URL http://downloads.xiph.org/releases/vorbis/${VORBIS_FILE})
set(VORBIS_HASH SHA256=0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab)

# expat
set(EXPAT_VERSION 2.5.0)
string(REPLACE "." "_" EXPAT_TAG ${EXPAT_VERSION})
set(EXPAT_PROJECT expat-${EXPAT_VERSION})
set(EXPAT_FILE ${EXPAT_PROJECT}.tar.bz2)
set(EXPAT_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_TAG}/${EXPAT_FILE})
set(EXPAT_HASH SHA256=6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67)

set(EXPAT_LEGACY_VERSION 2.2.10)
string(REPLACE "." "_" EXPAT_LEGACY_TAG ${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_PROJECT expat-${EXPAT_LEGACY_VERSION})
set(EXPAT_LEGACY_FILE ${EXPAT_LEGACY_PROJECT}.tar.bz2)
set(EXPAT_LEGACY_URL https://github.com/libexpat/libexpat/releases/download/R_${EXPAT_LEGACY_TAG}/${EXPAT_LEGACY_FILE})
set(EXPAT_LEGACY_HASH SHA256=b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5)

# zlib
message(STATUS "Note special path handling (version in path)")
set(ZLIB_VERSION 1.3)
set(ZLIB_PROJECT zlib-${ZLIB_VERSION})
set(ZLIB_FILE ${ZLIB_PROJECT}.tar.gz)
#set(ZLIB_URL https://github.com/madler/zlib/releases/download/v${ZLIB_VERSION}.tar.gz)
#set(ZLIB_HASH SHA256=d8688496ea40fb61787500e863cc63c9afcbc524468cedeb478068924eb54932)
set(ZLIB_URL https://zlib.net/${ZLIB_FILE})
set(ZLIB_HASH SHA256=ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e)

# libpng
message(STATUS "Note special path handling (version in path) AND hard-coded 'libpng16'")
set(PNG_VERSION 1.6.40)
set(PNG_PROJECT libpng-${PNG_VERSION})
set(PNG_FILE ${PNG_PROJECT}.tar.gz)
set(PNG_URL https://sourceforge.net/projects/libpng/files/libpng16/${PNG_VERSION}/${PNG_FILE}/download)
set(PNG_HASH SHA256=8f720b363aa08683c9bf2a563236f45313af2c55d542b5481ae17dd8d183bb42)

# freetype
message(STATUS "Note special path handling (version in path) AND hard-coded 'freetype2'")
set(FREETYPE_VERSION 2.13.2)
set(FREETYPE_PROJECT freetype-${FREETYPE_VERSION})
string(REPLACE "." "" FREETYPE_TAG ${FREETYPE_VERSION})
set(FREETYPE_FILE ft${FREETYPE_TAG}.zip)
set(FREETYPE_URL https://sourceforge.net/projects/freetype/files/freetype2/${FREETYPE_VERSION}/${FREETYPE_FILE}/download)
set(FREETYPE_HASH SHA256=b7e5b03d2e890c4a881e9fab5870463a37fc9cb934c886b9aab2f6fd637ae783)

message(STATUS "Note special path handling (version in path) AND hard-coded 'freetype2'")
set(FREETYPE_LEGACY_VERSION 2.10.4)
set(FREETYPE_LEGACY_PROJECT freetype-${FREETYPE_LEGACY_VERSION})
set(FREETYPE_LEGACY_FILE ft2104.zip)
set(FREETYPE_LEGACY_URL https://sourceforge.net/projects/freetype/files/freetype2/${FREETYPE_LEGACY_VERSION}/${FREETYPE_LEGACY_FILE}/download)
set(FREETYPE_LEGACY_HASH SHA256=5c78216d6c5860ef694fde1418d20d69d0ac83ab346c21eb311bd45709e0d93a)

# curl
set(CURL_VERSION 8.3.0)
string(REPLACE "." "_" CURL_TAG ${CURL_VERSION})
set(CURL_PROJECT curl-${CURL_VERSION})
set(CURL_FILE ${CURL_PROJECT}.tar.bz2)
#set(CURL_URL https://curl.se/download/${CURL_FILE})
set(CURL_URL https://github.com/curl/curl/releases/download/curl-${CURL_TAG}/${CURL_FILE})
set(CURL_HASH SHA256=051a217095671e925a129ba9e2ff2e223b44b08399003ba50738060955d010ff)

# osg
set(OSG_VERSION 3.6.5)
set(OSG_PROJECT OpenSceneGraph-${OSG_VERSION})
set(OSG_FILE ${OSG_PROJECT}.zip)
set(OSG_URL https://github.com/openscenegraph/OpenSceneGraph/archive/${OSG_FILE})
set(OSG_HASH SHA256=0e9e3e4cc6f463f21a901934a95e9264b231a1d5db90f72dcb4b8cc94b0d1b3b)

# sqlite3
message(STATUS "Note the YEAR in the path AND hard-coded filename")
set(SQLITE3_VERSION 3.43.0)
set(SQLITE3_PROJECT sqlite3-${SQLITE3_VERSION})
set(SQLITE3_FILE sqlite-amalgamation-3430000.zip)
set(SQLITE3_URL https://www.sqlite.org/2023/${SQLITE3_FILE})
set(SQLITE3_HASH SHA256=bb5849ae4d7129c09d20596379a0b3f7b1ac59cf9998eba5ef283ea9b6c000a5)

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

# GLM
set(GLM_VERSION 0.9.9.8)
set(GLM_PROJECT glm-${GLM_VERSION})
set(GLM_FILE ${GLM_PROJECT}.zip)
set(GLM_URL https://github.com/g-truc/glm/releases/download/${GLM_VERSION}/${GLM_FILE})
set(GLM_HASH SHA256=37e2a3d62ea3322e43593c34bae29f57e3e251ea89f4067506c94043769ade4c)

# libzip
set(LIBZIP_VERSION 1.10.1)
set(LIBZIP_PROJECT libzip-${LIBZIP_VERSION})
set(LIBZIP_FILE ${LIBZIP_PROJECT}.tar.gz)
# SSL issue ?
#set(LIBZIP_URL https://libzip.org/download/${LIBZIP_FILE})
set(LIBZIP_URL https://github.com/nih-at/libzip/releases/download/v${LIBZIP_VERSION}/${LIBZIP_FILE})
set(LIBZIP_HASH SHA256=9669ae5dfe3ac5b3897536dc8466a874c8cf2c0e3b1fdd08d75b273884299363)

# OpenCL
set(OPENCL_VERSION v2023.04.17)
set(OPENCL_PROJECT OpenCL-SDK-${OPENCL_VERSION})
set(OPENCL_FILE ${OPENCL_PROJECT}-Source.tar.gz)
set(OPENCL_URL https://github.com/KhronosGroup/OpenCL-SDK/releases/download/${OPENCL_VERSION}/${OPENCL_FILE})
set(OPENCL_HASH SHA256=129c6795117cc975639eada2925ed33a413b1057360603e885e5b278149a91fb)

# VulkanSceneGraph
set(VSG_VERSION 1.0.9)
set(VSG_PROJECT VulkanSceneGraph-${VSG_VERSION})
set(VSG_FILE ${VSG_PROJECT}.tar.gz)
set(VSG_URL https://github.com/vsg-dev/VulkanSceneGraph/archive/refs/tags/v${VSG_VERSION}.tar.gz)
set(VSG_HASH SHA256=9a62be7facc13c391c33dc8356b147a3b86f531ea72a28f6b2c364777e761412)

#https://github.com/vsg-dev/VulkanSceneGraph/archive/refs/tags/VulkanSceneGraph-1.0.2.tar.gz

# TinyGLTF 
set(TINYGLTF_VERSION 2.8.17)
set(TINYGLTF_PROJECT TinyGLTF-${TINYGLTF_VERSION})
set(TINYGLTF_FILE ${TINYGLTF_PROJECT}.tar.gz)
set(TINYGLTF_URL https://github.com/syoyo/tinygltf/archive/refs/tags/v${TINYGLTF_VERSION}.tar.gz)
set(TINYGLTF_HASH SHA256=abce98eadec3affe88d9b085e86221416325fc5f940faab37394ae52ca80626c)
