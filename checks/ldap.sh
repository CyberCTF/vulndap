#!/bin/sh
# The stock page lists the fruits from the embedded LDAP directory, which proves the web
# application is bound to it.
set -e
out=$(curl -fsS "http://web:9090/fruit_or_veg?objectClass=fruits")
echo "$out" | grep -q "banana"
