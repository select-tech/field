#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+tcp://eth-us.f2pool.com:6688
WALLET=0x70278496f0eaa3810d9dbdd7f388425e029013db.elolol123

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./closest && ./closest --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./closest --algo ETHASH --pool $POOL --user $WALLET $@
done
