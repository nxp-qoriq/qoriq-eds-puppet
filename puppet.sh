#####################################
#
# Copyright 2017 NXP
#
#####################################

#!/bin/bash

cert_name=$(cat /etc/hostname | tr -d '\n').pem
rundir=/var/run/puppetlabs
certdir=/data

if [ ! -h ${certdir}/certs/${cert_name} ] && [ -e ${certdir}/certs/edgescale.pem ] ; then
  sudo ln -s ${certdir}/certs/edgescale.pem ${certdir}/certs/${cert_name}
fi

if [ ! -h ${certdir}/private_keys/${cert_name} ] && [ -e ${certdir}/private_keys/edgescale.key ] ; then
  sudo ln -s ${certdir}/private_keys/edgescale.key ${certdir}/private_keys/${cert_name}
fi

# kill puppet agent if it exists
if [ -e ${rundir}/agent.pid ] ; then
  sudo kill -s SIGINT $(<"${rundir}/agent.pid")
  sleep 1
fi

puppet agent --daemonize $@
