#!/bin/sh
set -eux

aws s3 cp /etc/letsencrypt ${S3} --recursive
