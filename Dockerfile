FROM ubuntu

MAINTAINER me@rnr.name

# Install docker
RUN apt-get update && apt get install -yq wget build-essential php5-fpm

RUN adduser --system --no-create-home --disabled-login --group nagios && \
	groupadd nagcmd && usermod -G nagcmd nagios && \
	usermod -a -G nagcmd www-data && \
	usermod -a -G nagcmd www-data
	mkdir /tmp/nagios && cd /tmp/nagios && \
	wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.1.1.tar.gz && \
	tar xfz nagios-4.1.1.tar.gz && \
	cd nagios-4.1.1 && ./configure --with-command-group=nagcmd &&
	make all && make install
