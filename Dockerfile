FROM node:16-alpine
RUN apk update && apk add --no-cache git python3 g++ gcc make\
	pkgconfig libx11-dev libxkbfile-dev libsecret-dev
WORKDIR /app
RUN git clone https://github.com/eclipse-theia/theia
RUN cd theia &&\
	yarn &&\
	yarn download:plugins &&\
	yarn browser build &&\
	yarn autoclean --init && \
	echo *.ts >> .yarnclean && \
	echo *.ts.map >> .yarnclean && \
	echo *.spec.* >> .yarnclean && \
	yarn autoclean --force && \
	yarn cache clean
EXPOSE 3000

COPY start.sh /app
CMD ./start.sh
