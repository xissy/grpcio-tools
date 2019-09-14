FROM alpine:3.10.2
RUN apk add --no-cache build-base python3-dev py-pip git

ENV GRPCIO_VERSION='1.23.0' \
    GRPCIO_TOOLS_VERSION='1.23.0' \
    GRPC_GATEWAY_TAG='v1.11.1'

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install grpcio==${GRPCIO_VERSION}
RUN python3 -m pip install grpcio-tools==${GRPCIO_TOOLS_VERSION}

RUN mkdir -p /go/src/github.com/grpc-ecosystem
RUN cd /go/src/github.com/grpc-ecosystem && \
    git clone -b ${GRPC_GATEWAY_TAG} https://github.com/grpc-ecosystem/grpc-gateway.git

ENTRYPOINT ["python3", "-m", "grpc_tools.protoc"]

