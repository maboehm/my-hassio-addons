ARG BUILD_FROM
FROM $BUILD_FROM

LABEL maintainer "Marcel Hofmann <marcelhofmann@live.de>"

RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
		CC28DD82EF4C718C \
	&& echo "deb http://apt.pilight.org/ stable main" > /etc/apt/sources.list.d/pilight.list \
	&& apt-get update \
	&& apt-get install -y \
		pilight \
		pilight-webgui \
		jq \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 5000/tcp 5001/tcp

COPY run.sh /run.sh
COPY pilight-config.json /etc/pilight/config.json

ENTRYPOINT ["/run.sh"]
