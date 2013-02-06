#!/bin/bash


make clean
here=`pwd`

cd ../polar/library
./x86.sh
cd ${here}

LDFLAGS="-static" POLARSSL_CFLAGS="-I${here}/../polar/include/" \
POLARSSL_LIBS="-L${here}/../polar/library/ -lpolarssl" \
./configure --disable-lzo --with-crypto-library=polarssl \
--disable-plugins --disable-plugin-auth-pam  --disable-plugin-down-root && \
make -j4
