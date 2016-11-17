#!/bin/bash
#
#  ufw rule generator for CloudFlare
#  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  this is essentially a one liner, it hardly even deserves a script, but it's
#  getting one anyway, so i can share it on github.
#
#  17 nov 2016
#  @reptar_xl
#
#

if [[ $1 =~ ^-*h(elp)?$ ]]; then
	printf -- "%s: ufw rule generator for CloudFlare\n" $0
	printf -- "usage: %s | sudo sh\n" $0
	exit 0
fi

curl -s https://www.cloudflare.com/ips-v{4,6} \
| sed 's/.*/ufw allow from & port 80,443 proto tcp comment CloudFlare/'

exit 0
