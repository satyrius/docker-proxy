FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq && apt-get upgrade -qq \
    && apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" > /etc/apt/sources.list.d/nginx.list \
    && apt-get update -qq \
    && apt-get install nginx \
    && rm -rf /etc/nginx/*

COPY etc/ /etc/
EXPOSE 80 443

CMD [ "nginx", "-g", "daemon off;" ]
