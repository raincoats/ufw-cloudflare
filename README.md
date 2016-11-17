# ufw rule generator for CloudFlare

This script grabs all of CloudFlare's IP addresses and creates `ufw` rules to allow them on ports 80 and 443. With this, you can allow access only from CloudFlare servers and not from anywhere else.

# Usage

It outputs ufw rules to stdout, pipe it to sh.
