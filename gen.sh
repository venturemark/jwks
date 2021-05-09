#!/bin/bash

CERT_DAYS="3650"
PRIV_KEY="keys/oidc-issuer.key"
PUB_KEY="keys/oidc-issuer.key.pub"
PKCS_KEY="keys/oidc-issuer.pub"



rm -rf certs
rm -rf keys

mkdir -p certs
mkdir -p keys



openssl req \
        -x509 \
        -newkey rsa:2048 \
        -keyout certs/tls.key \
        -out certs/tls.crt \
        -days $CERT_DAYS -nodes -subj "/CN=public.venturemark.co"



ssh-keygen -t rsa -b 2048 -f $PRIV_KEY -m pem -N ""
ssh-keygen -e -m PKCS8 -f $PUB_KEY > $PKCS_KEY



go run ./main.go -key $PKCS_KEY > .well-known/keys.json
