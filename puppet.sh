#####################################
#
# Copyright 2017 NXP
#
#####################################

#!/bin/bash

cert_name=$(cat /etc/hostname | tr -d '\n').pem

sudo ln -s /etc/ssl/private/edgescale/certs/edgescale.pem /etc/ssl/private/edgescale/certs/$cert_name
sudo ln -s /etc/ssl/private/edgescale/private_keys/edgescale.key /etc/ssl/private/edgescale/private_keys/$cert_name
puppet agent --daemonize $@
