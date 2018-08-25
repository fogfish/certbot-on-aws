FROM certbot/certbot

RUN set -eu \
   && pip install certbot-dns-route53 \
   && pip install awscli