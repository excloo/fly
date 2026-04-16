#!/bin/sh
/app/tailscaled --socket=/var/run/tailscale/tailscaled.sock --state=/var/lib/tailscale/tailscaled.state &
/app/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=gatus
GATUS_CONFIG_PATH=/app/config /app/gatus
