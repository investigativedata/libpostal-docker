FROM python:3.13

RUN apt-get update && apt-get -y upgrade

# libpostal
# https://github.com/openvenues/pypostal#installation
RUN apt-get install -y curl autoconf automake libtool python3-dev pkg-config
RUN git clone https://github.com/openvenues/libpostal /libpostal
WORKDIR /libpostal
RUN ./bootstrap.sh
RUN ./configure --datadir=/data/libpostal
RUN make -j`nproc`
RUN make install
RUN ldconfig

