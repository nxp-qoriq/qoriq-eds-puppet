#####################################
#
# Copyright 2017 NXP
#
#####################################

INSTALL ?= install
INSTALL_DIR ?=

clean:

install:
	sudo $(INSTALL) -d --mode 755 $(INSTALL_DIR)/etc/puppetlabs/puppet/
	sudo $(INSTALL) --mode 644 ./puppet.conf $(INSTALL_DIR)/etc/puppetlabs/puppet/puppet.conf
	sudo $(INSTALL) -d --mode 755 $(INSTALL_DIR)/usr/local/bin/
	sudo $(INSTALL) --mode 755 ./puppet.sh $(INSTALL_DIR)/usr/local/bin/
	sudo $(INSTALL) --mode 644 ./openssl-sobj.cnf $(INSTALL_DIR)/etc/ssl/

.PHONY: install clean
