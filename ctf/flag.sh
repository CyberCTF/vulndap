#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) for the shop to load into its LDAP directory as the description of the user flagkeeper (build/web/start.sh), where the LDAP injection reaches it;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-vulndap}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /ctf/flag
chmod 444 /ctf/flag
