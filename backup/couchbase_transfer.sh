#! /bin/bash

DATE=`date +'%Y-%m-%d'`
PREV_DATE=`date +'%Y-%m-%d' --date='1 day ago'`
FILE=/home/compendium/${DATE}.tgz
PREV_FILE=/home/compendium/${PREV_DATE}.tgz

rm ${PREV_FILE}

scp -i res.pem compendium@res-cb-cluster.compendium.org:${FILE} .
