#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
DIR=simple-xml-$2
TAR=../simple-xml_$2.orig.tar.gz

# clean up the upstream tarball
tar -x -z -f $3
tar -c -z -f $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR $3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
    . .svn/deb-layout
    mv $TAR $origDir
    echo "moved $TAR to $origDir"
fi

exit 0
