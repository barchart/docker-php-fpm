#
# PHP FPM FastCGI worker
#
# docker-build properties:
# TAG=barchart/php-fpm:latest

FROM barchart/base
MAINTAINER Jeremy Jongsma "jeremy@barchart.com"

# Install PHP
RUN apt-get -y update && \
	apt-get -y install php5 php5-fpm php5-mysql php5-xdebug php5-curl php5-json && \
	apt-get clean

ADD etc/ /etc/

# Define mountable directories.
VOLUME ["/var/log/ext", "/var/www"]

# Define working directory.
WORKDIR /var/www

# Expose ports.
EXPOSE 9000

# Define default command.
CMD ["/usr/sbin/php5-fpm","-F","-R","-y","/etc/php-fpm.conf"]
