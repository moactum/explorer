FROM ubuntu:bionic

MAINTAINER Xinchun Liu <lospringliu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y locales wget iputils-ping net-tools vim git psmisc screen python3-pip nginx nodejs npm haproxy postgresql && ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN locale-gen "en_US.UTF-8"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN cd /var/www && git clone https://github.com/moactum/explorer.git
RUN cd /var/www/explorer && git submodule update --init 
RUN cd /var/www/explorer/koa && npm install
RUN cd /var/www/explorer/django && pip3 install -r requirements.txt

COPY deployments/default.nginx.example /etc/nginx/sites-available/default
RUN wget -q -O /root/moac https://daszichan.com/downloads/moac/moac
RUN chmod +x /root/moac

EXPOSE 8000 8545 3000 443 80
CMD ["/bin/bash"]
