FROM golang:alpine AS builder

ARG PROJECT=Groundstation-v2-Backend-Fork
ARG REPO=https://github.com/nuttwerx/Groundstation-v2-Backend

ARG GOLANG_VERSION=1.11
ARG PROTOC_VERSION=3.6.1

ARG COMMIT
# gcc 
RUN buildDeps='build-base libressl-dev util-linux-dev curl autoconf automake zlib clang g++ gcc wget'; \
		apk update && \
		apk add git \
		unzip \
		ca-certificates \
		libtool \
		$buildDeps


# Install protocol buffers compiler
RUN wget https://github.com/google/protobuf/archive/v${PROTOC_VERSION}.tar.gz && \
tar zxvf v${PROTOC_VERSION}.tar.gz  && \
cd protobuf-${PROTOC_VERSION} && \
./autogen.sh && \
./configure && \
make && \
make install && \
ldconfig / && \
cd ${GOPATH} && \
rm v${PROTOC_VERSION}.tar.gz && \
rm -rf protobuf-${PROTOC_VERSION}

RUN go get -u google.golang.org/grpc
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN mkdir -p ${GOPATH}/src/rloop/

WORKDIR ${GOPATH}/src/rloop/

RUN git clone ${REPO} ./${PROJECT}
WORKDIR ${GOPATH}/src/rloop/${PROJECT}
RUN git checkout ${COMMIT}}
WORKDIR ${GOPATH}/src/rloop/

RUN go build ./${PROJECT}/main.go

FROM golang:alpine

ARG PROJECT=Groundstation-v2-Backend-Fork
RUN mkdir -p ${GOPATH}/src/rloop/
WORKDIR ${GOPATH}/src/rloop/
COPY --from=builder ${GOPATH}/src/rloop/${PROJECT}/config ${GOPATH}/src/rloop/config/
COPY --from=builder ${GOPATH}/src/rloop/main ${GOPATH}/src/rloop/main
CMD ./main

