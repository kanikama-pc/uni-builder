#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="uni-os-release"
PKG_VER="0.1~builder"
PKG_ARCH="all"

OS_VER="0.1"
CODE_NAME="beta"

cd $(dirname "$0")

rm -r work
cp -a src work

sed -i "s/PKG_VER/${PKG_VER}/" work/DEBIAN/control
sed -i "s/OS_VER/${OS_VER}/g" work/DEBIAN/postinst
sed -i "s/CODE_NAME/${CODE_NAME}/g" work/DEBIAN/postinst

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb
