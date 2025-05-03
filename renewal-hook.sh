#!/bin/bash
set -e

CERT_PATH="/etc/letsencrypt/live/$DOMAIN"
DEST_PATH="/certs"

mkdir -p $DEST_PATH

cp "$CERT_PATH/fullchain.pem" "$DEST_PATH/fullchain.pem"
cp "$CERT_PATH/privkey.pem" "$DEST_PATH/privkey.pem"

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"Certificate for $DOMAIN was successfully renewed and copied.\"}" \
     "$DISCORD_WEBHOOK_URL"