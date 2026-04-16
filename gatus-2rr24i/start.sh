#!/bin/sh
set -e
export PATH="/app:$PATH"
tailscaled --socket=/var/run/tailscale/tailscaled.sock --state=/var/lib/tailscale/tailscaled.state &
tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=gatus
GATUS_CONFIG_PATH=/app/config gatus