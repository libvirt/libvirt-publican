#!/bin/sh

set -e
set -v

: ${AUTOBUILD_INSTALL_ROOT=$HOME/builder}

make clean || :

make
rm -f $AUTOBUILD_INSTALL_ROOT/share/publican/Common_Content/common
mkdir -p $AUTOBUILD_INSTALL_ROOT/share/publican/Common_Content
ln -s /usr/share/publican/Common_Content/common $AUTOBUILD_INSTALL_ROOT/share/publican/Common_Content/common
make install prefix=$AUTOBUILD_INSTALL_ROOT

if [ -x /usr/bin/rpmbuild ]
then
  make rpm

  if [ -n "$AUTOBUILD_PACKAGE_ROOT" -a -d "$AUTOBUILD_PACKAGE_ROOT/rpm" ]
  then
    mv tmp/rpm/*.src.rpm "$AUTOBUILD_PACKAGE_ROOT/rpm/SRPMS"
    mv tmp/rpm/noarch/*.noarch.rpm "$AUTOBUILD_PACKAGE_ROOT/rpm/RPMS/noarch"
  fi
fi
