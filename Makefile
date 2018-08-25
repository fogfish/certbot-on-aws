.PHONY: all build publish aws

APP ?= certbot
ORG ?= fogfish
URI ?=

STACK = $(subst .,-,$(DOMAIN))

all: build publish

build:
	docker build -t ${ORG}/${APP} .

publish:
	docker push ${ORG}/${APP}

aws:
	aws cloudformation create-stack \
   	--stack-name tls-ca-${STACK} \
   	--parameters \
         ParameterKey=S3,ParameterValue=${S3} \
         ParameterKey=Email,ParameterValue=${EMAIL} \
         ParameterKey=Domain,ParameterValue=${DOMAIN} \
   	--template-body file://./aws.yml \
   	--capabilities CAPABILITY_IAM \
   	--capabilities CAPABILITY_NAMED_IAM && \
	aws cloudformation wait stack-create-complete \
		--stack-name tls-ca-${STACK} && \
	aws codebuild start-build --project-name tls-ca-${STACK}

