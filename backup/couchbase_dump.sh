#! /bin/bash

DATE=`date +'%Y-%m-%d'`

cbbackup http://127.0.0.1:8091 /opt/couchbase/var/lib/couchbase/tmp/$DATE -u <user> -p <password>
