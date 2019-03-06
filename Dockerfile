FROM alpine:3.9
RUN apk add --no-cache build-base python2-dev py-pip git

ENV GRPCIO_VERSION='1.12.0' \
    GRPCIO_TOOLS_VERSION='1.12.0' \
    GRPC_GATEWAY_TAG='v1.4.1' \
    PROTOC_GEN_VALIDATE='v0.0.13'

RUN python -m pip install --upgrade pip
RUN python -m pip install grpcio==${GRPCIO_VERSION}
RUN python -m pip install grpcio-tools==${GRPCIO_TOOLS_VERSION}

RUN mkdir -p /go/src/github.com/grpc-ecosystem
RUN cd /go/src/github.com/grpc-ecosystem && \
    git clone -b ${GRPC_GATEWAY_TAG} https://github.com/grpc-ecosystem/grpc-gateway.git

RUN mkdir -p /go/src/github.com/lyft
RUN cd /go/src/github.com/lyft && \
    git clone -b ${PROTOC_GEN_VALIDATE} https://github.com/lyft/protoc-gen-validate.git

ENTRYPOINT ["python", "-m", "grpc_tools.protoc"]

