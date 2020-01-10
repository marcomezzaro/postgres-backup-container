#!/bin/bash
DUMP_PREFIX=${PREFIX}
DUMP_FILE_NAME="${DUMP_PREFIX}-`date +%Y-%m-%d-%H-%M`.dump"
EXCLUDE_TABLE=${EXCLUDE}
echo "Creating dump: $DUMP_FILE_NAME"

cd pg_backup

if [ -n ${EXCLUDE_TABLE} ]; then
    pg_dump -C -w --format=c --blobs -T ${EXCLUDE_TABLE} > $DUMP_FILE_NAME 
else
    pg_dump -C -w --format=c --blobs > $DUMP_FILE_NAME
fi

if [ $? -ne 0 ]; then
  rm $DUMP_FILE_NAME
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo 'Successfully Backed Up'
exit 0
