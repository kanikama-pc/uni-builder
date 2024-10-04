#!/bin/bash

PKG_NAME="calamares-settings-uni"
PKG_VER="0.1"
PKG_ARCH="all"

OS_VER="0.1"
CODE_NAME="beta"

cd $(dirname "$0")

rm -r work
cp -a src work

sed -i "s/PKG_VER/${PKG_VER}/" work/DEBIAN/control
sed -i "s/OS_VER/${OS_VER}/g" work/etc/calamares/branding/link/branding.desc
sed -i "s/CODE_NAME/${CODE_NAME}/g" work/etc/calamares/branding/link/branding.desc

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb
