#!/bin/bash

make clean
LDFLAGS="-static" POLARSSL_CFLAGS="-I/home/fabrizio/work/ovpn/polarssl-1.2.4/include/" POLARSSL_LIBS="-L/home/fabrizio/work/ovpn/polarssl-1.2.4/library/ -lpolarssl" ./configure --disable-lzo --with-crypto-library=polarssl --disable-plugin-auth-pam  --disable-plugin-down-root && make -j4
