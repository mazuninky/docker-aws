FROM alpine

LABEL maintainer="Mazunin Konstantin <mazuninky@gmail.com>"

RUN apk add --no-cache python; \
#############
## AWS CLI ##
#############
    wget --output-document="awscli-bundle.zip" "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip"; \
	unzip awscli-bundle.zip; \
	./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws; \
	rm awscli-bundle.zip && rm -rf awscli-bundle; \
    aws --version; \
#########
## IMG ##
#########
    wget --output-document="/usr/local/bin/img" "https://github.com/genuinetools/img/releases/download/v0.5.7/img-linux-amd64"; \
	chmod a+x "/usr/local/bin/img"; \
    img version