#! /bin/bash

DATE=`date +'%Y-%m-%d'`
EXPIRY_DATE=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
REMOTE_FILE=/home/compendium/${DATE}.tgz
LOCAL_FILE=${DATE}.tgz
SAS=`az storage blob generate-sas --account-name compendium --container-name couchbase --name ${LOCAL_FILE} --permissions acdrw --expiry ${EXPIRY_DATE} | tail -n1 | tr -d \"` 

echo ${SAS}

scp -i res.pem compendium@respedia-res.eastus.cloudapp.azure.com:${REMOTE_FILE} .
azcopy copy ${DATE}.tgz  https://compendium.blob.core.windows.net/couchbase/?${SAS}

rm ${LOCAL_FILE}