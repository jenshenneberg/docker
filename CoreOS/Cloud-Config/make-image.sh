#!/bin/bash
DIR=$(cd $(dirname $0) && pwd)
DRIVE=$DIR/configdrive.iso
if [[ -f $DRIVE ]];
then
    echo "Image already exists: $DRIVE"
    exit 1
fi
pushd $DIR
/usr/bin/hdiutil makehybrid -iso -joliet -default-volume-name config-2 -o $DRIVE new-drive/
RETVAL=$?
popd
exit $RETVAL
