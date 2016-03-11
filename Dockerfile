FROM rubenv/dev-env-vim

RUN dnf install -y autoconf automake libtool curl git unzip make gcc-c++ golang && \
    cd /tmp && \
    git clone https://github.com/google/protobuf.git && \
    cd /tmp/protobuf/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make check && \
    make install && \
    rm -rf /tmp/protobuf/ && cd && \
    dnf -y remove autoconf automake libtool unzip gcc-c++ && \
    dnf clean all && \
    mkdir -p /go && \
    export GOPATH=/go && \
    go get -v github.com/gogo/protobuf/protoc-gen-gogo

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/bin:/usr/bin
