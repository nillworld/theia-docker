FROM node:16-alpine
RUN apk update && apk add --no-cache git python3 g++ gcc make\
	pkgconfig libx11-dev libxkbfile-dev libsecret-dev

COPY /theia /app/theia
WORKDIR /app

EXPOSE 3000

COPY start.sh /app
CMD ./start.sh