FROM ubuntu:xenial

MAINTAINER Xinchun Liu <lospringliu@gmail.com>

RUN apt-get update && apt-get install -y locales wget iputils-ping net-tools vim git psmisc screen nginx nodejs haproxy

RUN locale-gen "en_US.UTF-8"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN cd /var/www && git clone https://github.com/moactum/explorer.git
RUN cd /var/www/explorer && git submodule update --init 
RUN cd /var/www/explorer/koa && npm install

COPY deployments/default.nginx.example /etc/nginx/sites-available/default
RUN wget -q -O /root/moac http://daszichan.com/downloads/moac/moac
RUN chmod +x /root/moac

EXPOSE 8000 3000 443 80
CMD ["/bin/bash"]
