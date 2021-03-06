#!/bin/bash

t_Log "Running $0 -  Verifying that kmod-ixbe installs and loads"

if [ "$centos_ver" = "7" ] ; then
  t_InstallPackage kmod-ixgbe
  modinfo ixgbe | grep 'filename' | egrep 'extra|weak' | grep -q 'ixgbe.ko'
  t_CheckExitStatus $?
else
  t_log "previous versions than CentOS 7 aren't using kmod-ixgbe ... skipping"
  exit 0
fi

