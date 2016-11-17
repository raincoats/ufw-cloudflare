# ufw rule generator for CloudFlare

This script grabs all of CloudFlare's IP addresses and creates `ufw` rules to allow them on ports 80 and 443. With this, you can allow access only from CloudFlare servers and not from anywhere else.

# Usage

Run the script by itself to automatically add the rules. Pass the flag `rm` to remove them, and the flag `test` to print the rules to stdout without adding them.
