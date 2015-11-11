#!/bin/sh

set -x
set -o errexit
prefix=${PREFIX:-${1:-bitscout/}}
version=${VERSION:-${2:-latest}}
docker build -t "${prefix}elasticsearch:${version}" .
docker build -t "${prefix}elasticsearch-app:${version}" nulecule/

if [ -n "${PUSH:-$3}" ]; then
	docker push "${prefix}elasticsearch:${version}"
fi