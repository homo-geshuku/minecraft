FROM amazon/aws-cli:latest as downloader
WORKDIR /mods
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ARG AWS_ENDPOINT
ARG BUCKET_NAME
ARG MOD_DIRECTORY
RUN aws s3 sync s3://${BUCKET_NAME}/${MOD_DIRECTORY} ./ --endpoint-url ${AWS_ENDPOINT}

FROM itzg/minecraft-server:java8 as runner
COPY --from=downloader /mods /data/mods
