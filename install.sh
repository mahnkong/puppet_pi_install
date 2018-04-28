#!/bin/bash

if [[ $EUID > 0 ]]; then # we can compare directly with this syntax.
    echo "Please run as root/sudo"
    exit 1
fi

export FACTER_PRIVATE_SOURCES_DIR=/mnt/hdd/data/files/private_repos/pi_install
export FACTER_PRIVATE_CONF_SOURCES_DIR=${FACTER_PRIVATE_SOURCES_DIR}/cfg
export FACTER_LETSENCRYPT_DATA_DIR=/mnt/hdd/data/files/critical/letsencrypt

apt update
if ! which puppet >/dev/null  || [ "$FORCE_PUPPET_INSTALL" != "" ]; then
    apt install puppet
fi
puppet apply --modulepath ./modules manifests/site.pp
