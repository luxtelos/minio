FROM nginx:stable-alpine-slim@sha256:77da26c31397bf6694b4bf93275f5b40b0b120ba1b8f114264b603e592c561d6

COPY 15-render-dns.envsh /docker-entrypoint.d/15-render-dns.envsh
COPY minio-console.conf.template /etc/nginx/templates/

RUN chmod +x /docker-entrypoint.d/15-render-dns.envsh && \
    rm /etc/nginx/conf.d/default.conf \
       /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
