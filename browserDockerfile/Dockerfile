FROM node:16-alpine
RUN apk update && apk add --no-cache git python3 g++ gcc make\
	pkgconfig libx11-dev libxkbfile-dev libsecret-dev

COPY /copyTheia /app/buildedTheia
WORKDIR /app
RUN cd buildedTheia &&\
	yarn &&\
	yarn download:plugins

EXPOSE 3000

COPY start.sh /app
CMD ./start.sh