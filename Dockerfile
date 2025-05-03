FROM alpine:latest

RUN apk add --no-cache certbot curl bash tzdata

WORKDIR /app

COPY entrypoint.sh /app/
COPY renew.sh /app/
COPY renewal-hook.sh /app/

RUN chmod +x /app/*.sh

ENTRYPOINT ["/app/entrypoint.sh"]