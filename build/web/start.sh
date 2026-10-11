#!/bin/sh
# Starts vuLnDAP. Its LDAP directory comes from vulndap.cfg, read once at start. The CTF flag
# (written to /ctf/flag by ctf/flag.sh once the shop answers) becomes the description of one more
# directory user, so a first start without it restarts the shop as soon as the flag lands; later
# starts find it in the volume and start with it at once.
cd /opt/vulndap
write_cfg() {
  cp vulndap.cfg-sample vulndap.cfg
  [ -s /ctf/flag ] || return 0
  printf '\n[[users]]\n\tname = "flagkeeper"\n\tunixid = 5004\n\tprimarygroup = 5502\n\tdescription = "%s"\n\tpasssha256 = "%s"\n\tgecos = "Flag Keeper,Sheffield,0114 NOT TELLING,flagkeeper@digi.ninja"\n' \
    "$(head -n 1 /ctf/flag)" "$(head -c 32 /dev/urandom | sha256sum | cut -d' ' -f1)" >> vulndap.cfg
}
if [ ! -s /ctf/flag ]; then
  write_cfg
  vuLnDAP & pid=$!
  i=0; while [ ! -s /ctf/flag ] && [ "$i" -lt 600 ]; do sleep 1; i=$((i + 1)); done
  sleep 1; kill "$pid"; wait "$pid" 2>/dev/null
fi
write_cfg
exec vuLnDAP
