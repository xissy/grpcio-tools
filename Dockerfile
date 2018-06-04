FROM alpine:3.7
RUN apk add --no-cache build-base python2-dev py-pip

ENV GRPCIO_VERSION=1.12.0 \
    GRPCIO_TOOLS_VERSION=1.12.0

RUN python -m pip install --upgrade pip
RUN python -m pip install grpcio==${GRPCIO_VERSION}
RUN python -m pip install grpcio-tools==${GRPCIO_TOOLS_VERSION}

ENTRYPOINT ["python", "-m", "grpc_tools.protoc"]
