FROM ghcr.io/twin/gatus:stable AS gatus
FROM docker.io/tailscale/tailscale:stable AS tailscale
FROM alpine:latest
RUN apk add --no-cache ca-certificates iptables ip6tables && mkdir -p /var/cache/tailscale /var/lib/tailscale /var/run/tailscale
COPY --from=gatus /gatus /app/gatus
COPY --from=tailscale /usr/local/bin/tailscaled /app/tailscaled
COPY --from=tailscale /usr/local/bin/tailscale /app/tailscale
WORKDIR /app
COPY app/ ./
COPY start.sh start.sh
RUN chmod +x start.sh
ENTRYPOINT ["/app/start.sh"]
