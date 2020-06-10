#build stage
FROM node:12.18.0-alpine AS builder

LABEL MAINTAINER="Penguin Cho"

COPY . /react-docker-env

WORKDIR /react-docker-env

RUN npm install --silent
RUN npm run build && echo "Build End"

# #run stage
FROM node:12.18.0-alpine

WORKDIR /root/

COPY --from=builder /react-docker-env/build ./build

COPY ./env.sh ./
COPY ./.env ./

RUN npm install -g serve

EXPOSE 3000

ENTRYPOINT ["sh", "/root/env.sh"]

CMD [ "serve", "-s", "build", "-l", "3000" ]