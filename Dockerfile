FROM golang:latest AS builder

RUN go get github.com/uber/makisu/bin/makisu

FROM alpine

LABEL maintainer="Mazunin Konstantin <mazuninky@gmail.com>"

RUN apk add --no-cache python libc6-compat; \
#############
## AWS CLI ##
#############
    wget --output-document="awscli-bundle.zip" "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip"; \
	unzip awscli-bundle.zip; \
	./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws; \
	rm awscli-bundle.zip && rm -rf awscli-bundle; \
    aws --version;

#############
## Makisu  ##
#############
COPY --from=builder /go/bin/makisu /usr/local/bin/makisu