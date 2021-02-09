ARG BUILD_FROM=homeassistant/aarch64-base
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
LABEL io.hass.version="0.1.0" io.hass.type="addon" io.hass.arch="aarch64"
