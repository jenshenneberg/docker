#!/bin/bash
# cd /opt/fhem; /usr/bin/perl /opt/fhem/fhem.pl /opt/fhem/fhem-main.cfg | /usr/bin/tee -a ./log/fhem-$(date +%Y-%m).log
DIR=/opt/fhem
LOG=$DIR/fhem-$(date +%Y-%m).log
CONFIG=DIR/fhem-main.cfg
FHEM=/opt/fhem/fhem.pl
PERL=$(command -v perl)
TEE=$(command -v tee)
pushd $DIR
$PERL $FHEM $CONFIG | $TEE -a $LOG
RETVAL=$?
popd
exit $RETVAL
