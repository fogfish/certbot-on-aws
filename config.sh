#!/bin/sh
set -eux

aws s3 cp ${S3} /etc/letsencrypt --recursive

if [ `ls -1A /etc/letsencrypt | wc -l` -eq 0 ] ;
then
   certbot register --agree-tos --register-unsafely-without-email
fi
