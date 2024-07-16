FROM nginx:alpine

ENV VERSION=v3.3.1

WORKDIR /app
EXPOSE 80

RUN apk add --no-cache openjdk21-jre

RUN wget https://github.com/pdinklag/MinecraftStats/releases/download/${VERSION}/MinecraftStatsCLI.zip \
	&& unzip MinecraftStatsCLI.zip \
	&& rm MinecraftStatsCLI.zip

RUN wget https://github.com/pdinklag/MinecraftStats/releases/download/${VERSION}/MinecraftStatsWeb.zip \
	&& unzip MinecraftStatsWeb.zip -o -d /usr/share/nginx/html/ \
	&& rm MinecraftStatsWeb.zip

RUN echo '*/5 *  *  *  * java -jar /app/MinecraftStatsCLI.jar /app/config.json' >> /etc/crontabs/root

COPY config.json .
COPY launch.sh /launch.sh

CMD ["/launch.sh"]
