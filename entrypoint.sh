#!/bin/sh

set -e

CONF=/etc/nginx/conf.d/default.conf
VARS='$SERVICE_HOST:$SERVICE_PORT:$HTPASSWD_PATH'
envsubst $VARS < ${CONF}.template > $CONF

eval "$@"
