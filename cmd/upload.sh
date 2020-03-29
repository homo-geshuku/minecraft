#!/bin/ash
if [ -d /minecraft_data/world ]; then
  filename=${PREFIX}-$(date "+%Y%m%d%H%M").zip
  zip -r /tmp/${filename} /minecraft_data/
  echo minecraft world upload: ${filename}
  aws s3 cp /tmp/${filename} s3://${S3_BUCKET}/${filename} --endpoint-url ${AWS_ENDPOINT}
fi
