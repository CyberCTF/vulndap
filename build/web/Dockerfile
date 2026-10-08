# vuLnDAP ships no Dockerfile (upstream: `go get` the GOPATH-era source, `go build`, copy
# vulndap.cfg-sample to vulndap.cfg, run ./vuLnDAP; the LDAP directory is served by the same
# process on localhost:10389 and the web application listens on 9090). This image builds the
# source from app/ with Go 1.22 and the go.mod / go.sum next to this file, which pin every
# dependency to its last version before upstream's last commit (February 2020); blackfriday stays
# at v2.0.0, the last release that still builds under its gopkg.in import path. The run stage uses
# upstream's sample configuration unchanged as vulndap.cfg.
FROM docker.io/library/golang:1.22-bookworm AS build
WORKDIR /src
COPY app/ .
COPY go.mod go.sum ./
RUN CGO_ENABLED=0 go build -trimpath -o /vuLnDAP .

FROM docker.io/library/debian:bookworm-slim
WORKDIR /opt/vulndap
COPY --from=build /vuLnDAP /usr/local/bin/vuLnDAP
COPY app/resources/ resources/
COPY app/resources.md .
COPY app/vulndap.cfg-sample vulndap.cfg
EXPOSE 9090
CMD ["vuLnDAP"]
