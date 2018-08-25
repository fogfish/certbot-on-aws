#!/bin/bash
set -eux

mkdir /etc/letsencrypt

aws s3 cp ${S3} /etc/letsencrypt --recursive

[ `ls -1A . | wc -l` -eq 0 ] && certbot register --agree-tos --register-unsafely-without-email
