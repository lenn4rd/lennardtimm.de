FROM nginx:alpine

LABEL org.opencontainers.image.source="https://github.com/lenn4rd/lennardtimm.de"

COPY build/ /usr/share/nginx/html/
