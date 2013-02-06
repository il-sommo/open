#!/bin/bash

make clean
here=`pwd`

LDFLAGS="-static" POLARSSL_CFLAGS="-I${here}/../polar/include/" POLARSSL_LIBS="-L${here}/../polar/library/ -lpolarssl" ./configure --disable-lzo --with-crypto-library=polarssl --disable-plugin-auth-pam  --disable-plugin-down-root && make -j4
