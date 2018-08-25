# CertBot on AWS

The project provides a serverless integration with https://letsencrypt.org for microservices hosted on AWS.

You should only use this solution only if you are not able to utilize AWS ELB otherwise just takes a benefits from free usage of AWS Certificates service.

The project provides AWS CodeBuild scripts that obtains a wildcard certificate from Let’s Encrypt on on a machine other than target servers, using [certbot](https://certbot.eff.org) and its AWS Route53 [plugin](https://certbot-dns-route53.readthedocs.io/en/latest/). Project automates periodic code build execution that either fetches a new certificate or re-new existed one. Certificates are stored in S3 bucket within your account. 

## Getting Started

The latest version of all artifacts is available at `master` branch. All development, including new features and bug fixes, take place on the `master` branch using forking and pull requests. All latest artifacts are available at Docker Hub.

Configure CertBot for your domain. Please keep in-mind that following command assumes that you have access to AWS account and command-line tools.

```bash
git clone https://github.com/fogfish/certbot-on-aws
cd certbot-on-aws

make aws \
   S3=s3://my-secret-bucket-for-keys/letsencrypt \
   EMAIL=my@contact.email \
   DOMAIN=my.domain.com
```

The command spawns serverless resources required to obtain wildcard certificate for your domain and triggers a AWS CodeBuild project for the first time. After that, renewal is triggered every 1st day of each month.

You'll find specified keys in S3 bucket!!!

## Hacking

* Cloud Formation [template](aws.yml) spawn all resources required by project 
* [Build specification](buildspec.yml) orchestrates `certbot` processes

## License

Copyright (c) 2018 Dmitry Kolesnikov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



