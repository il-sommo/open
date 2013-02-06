#!/bin/bash

make clean
here=`pwd`

cd ../polar/library
./ppc.sh
cd ${here}

ARCH=ppc CROSS_COMPILE=ppc_4xx- \
LDFLAGS="-static" POLARSSL_CFLAGS="-I${here}/../polar/include/" \
POLARSSL_LIBS="-L${here}/../polar/library/ -lpolarssl" \
./configure --host=powerpc-linux --disable-lzo --with-crypto-library=polarssl \
--disable-plugin-auth-pam  --disable-plugin-down-root && \
ARCH=ppc CROSS_COMPILE=ppc_4xx- CC=ppc_4xx-gcc make -j4

