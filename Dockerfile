FROM node:16-alpine
RUN apk update && apk add --no-cache git python3 g++ gcc make\
	pkgconfig libx11-dev libxkbfile-dev libsecret-dev
WORKDIR /app
RUN git clone https://github.com/eclipse-theia/theia
RUN cd theia \
	&& yarn \
	&& yarn download:plugins \
	&& yarn browser build 
EXPOSE 3000

COPY start.sh /app
RUN chmod +x /app/start.sh
