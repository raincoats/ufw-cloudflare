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
	printf -- "usage:\n"
	printf -- "          to add the rules:  %s\n" $0
	printf -- "  to see what would happen:  %s test\n" $0
	printf -- "           to delete rules:  %s rm\n" $0
	printf -- "\nhttps://github.com/raincoats/ufw-cloudflare\n"
	exit 0
elif [[ $1 =~ ^-*rm$ ]]; then
	while true; do
		r=$(ufw status numbered \
			| egrep '# CloudFlare$' \
			| tr -d '[]' \
			| awk '{ print $1 }')
		[[ -z $r ]] && break
		yes | ufw delete $r
	done
	exit 0
elif [[ $1 =~ ^-*test$ ]]; then
	shell=cat
fi


if [[ $(id -u) -ne 0 ]] && [[ -z $shell ]]; then
	printf "you will need to run this as root, sorry :/\n"
	exit 1
fi

curl -s https://www.cloudflare.com/ips-v{4,6} \
| sed 's/.*/ufw allow from & to any port 80,443 proto tcp comment CloudFlare/' \
| ${shell:-sh}

exit 0
