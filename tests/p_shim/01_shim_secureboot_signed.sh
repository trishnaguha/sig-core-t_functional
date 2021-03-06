#!/bin/bash
# This test will verify that shim.efi is correctly signed with correct cert in the CA chain

t_Log "Running $0 -  Verifying that shim.efi is correctly signed with correct cert"

if [ "$centos_ver" = "7" ] ; then
  t_InstallPackage pesign shim
  pesign --show-signature --in /boot/efi/EFI/centos/shim.efi|grep -q 'Red Hat Inc.'
  t_CheckExitStatus $?
else
  t_log "previous versions than CentOS 7 aren't using shim/secureboot ... skipping"
  exit 0
fi

