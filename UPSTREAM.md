# Upstream

| | |
| --- | --- |
| Project | vuLnDAP |
| Repository | https://github.com/digininja/vuLnDAP |
| Version | master (no releases; last commit 2020-02-26) |
| Commit | 4bf0d0cfffd3424109126547505cb2e3ed5e2911 |
| Licence | GPL-3.0 |

`build/web/app/` is that commit, unchanged, without its Git history (including upstream's
prebuilt binaries in `bin/`, which the image does not use). Upstream has no Dockerfile and no
`go.mod` (GOPATH era): `build/web/Dockerfile` builds the source with Go 1.22 using
`build/web/go.mod` and `go.sum`, which pin each dependency to its last version before February
2020 (BurntSushi/toml v0.3.1, logrus v1.4.2, nmcclain/ldap at 3b3b69a, gopkg.in/ldap.v2 v2.5.1,
blackfriday v2.0.0), and runs it on `debian:bookworm-slim` with upstream's `vulndap.cfg-sample`
as `vulndap.cfg`. To update, replace `build/web/app/` with a newer commit, then change this table
(and the pins if the imports change).
