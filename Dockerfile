FROM openjdk:8-alpine

# awscli preinstall
RUN apk update
RUN apk add python3 zip

# awscli install
RUN pip3 install awscli

# initial setting
VOLUME /minecraft_data
WORKDIR /minecraft_data
