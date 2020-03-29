#!/bin/ash
filename=$(aws s3 ls s3://${S3_BUCKET} --endpoint-url ${AWS_ENDPOINT} | grep ${PREFIX}- | awk '{print $4}' | sort -r | head -n ${DAYS_BEFORE} | tail -n 1)
echo minecraft world download: ${filename}
aws s3 cp s3://${S3_BUCKET}/${filename} /tmp/data.zip --endpoint-url ${AWS_ENDPOINT}
unzip -u -o /tmp/data.zip -d /
