#####################################
#
# Copyright 2017 NXP
#
#####################################

#!/bin/bash

cert_name=$(cat /etc/hostname | tr -d '\n').pem
rundir=/var/run/puppetlabs
certdir=/etc/ssl/private/edgescale

[ ! -h ${certdir}/certs/${cert_name} ] && [ -e ${certdir}/certs/edgescale.pem ] && \
sudo ln -s ${certdir}/certs/edgescale.pem ${certdir}/certs/${cert_name}

[ ! -h ${certdir}/private_keys/${cert_name} ] && [ -e ${certdir}/private_keys/edgescale.key ] && \
sudo ln -s ${certdir}/private_keys/edgescale.key ${certdir}/private_keys/${cert_name}

# kill puppet agent if it exists
[ -e ${rundir}/agent.pid ] && sudo kill -s SIGINT $(<"${rundir}/agent.pid")

puppet agent --daemonize $@
