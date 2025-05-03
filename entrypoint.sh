#!/bin/bash
set -e

certbot renew \
  --dns-cloudflare \
  --dns-cloudflare-credentials /app/cloudflare.ini \
  --deploy-hook /app/renewal-hook.sh \
  --quiet