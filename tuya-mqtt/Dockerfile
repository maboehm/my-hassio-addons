ARG BUILD_FROM=homeassistant/amd64-base
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --update --no-cache npm

WORKDIR /usr/src/app

COPY src/package*.json ./

RUN npm install
RUN mkdir /data

COPY src/ .
COPY run.sh .

CMD ["./run.sh"]
