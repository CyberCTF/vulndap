# vuLnDAP

[vuLnDAP](https://github.com/digininja/vuLnDAP) by Robin Wood (digininja): a deliberately
vulnerable web application to demonstrate exploiting business logic flaws, and LDAP injection, in
a site based on LDAP. One Go process serves the web shop and the LDAP directory it queries. This
repository runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml)
describes the machine, and the upstream source in [`build/web/app/`](build/web/app) is built by a
Dockerfile written for it (upstream ships none), with its dependencies pinned.

| Machine | Service |
| --- | --- |
| web | vuLnDAP web application on port 9090, published on 9032 (LDAP on localhost:10389 inside) |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:9032/. The same spec runs as Docker on a local VM (`docker-vm`), on a
cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the
[project page](https://digi.ninja/projects/vulndap.php) and, when stuck, the
[walkthrough](https://digi.ninja/blog/vulndap_walkthrough.php).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-3.0, as vuLnDAP ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
