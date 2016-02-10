FROM fedora

RUN dnf install autoconf automake libtool curl git unzip make gcc-c++ golang && \
    cd /tmp && \
    git clone https://github.com/google/protobuf.git && \
    cd /tmp/protobuf/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make check && \
    make install
