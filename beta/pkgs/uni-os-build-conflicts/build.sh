#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="uni-os-build-conflicts"
PKG_VER="0.1"
PKG_ARCH="all"

cd $(dirname "$0")

rm -r work
cp -a src work

sed -i "s/PKG_VER/${PKG_VER}/" work/DEBIAN/control

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb
