FROM docker:19.03.4


MAINTAINER Mazunin Konstantin <mazuninky@gmail.com>

#############
## AWS CLI ##
#############

RUN apk add curl python
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws