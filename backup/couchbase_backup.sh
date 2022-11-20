#! /bin/bash

DATE=`date +'%Y-%m-%d'`
DIR=/home/compendium/couchbase/lib/couchbase/tmp/$DATE
FILE=/home/compendium/${DATE}.tgz

docker exec -i couchbase /bin/bash < couchbase_dump.sh

tar zcf ${FILE} -C ${DIR} .

sudo rm -fr ${DIR}
