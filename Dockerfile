FROM node:20-alpine

RUN apk --no-cache add curl

ENV NODE_ENV production
ENV PORT 80
ENV DB_EXPOSE_PORT 8080
ENV DB_PREFIX /data/dbs/
ENV SECRET_DIRNAME /data

WORKDIR /usr/src/app

COPY . .
RUN npm install --production --silent \
    && mkdir -p /data/dbs

EXPOSE 80

CMD ./Dockerstart.sh
