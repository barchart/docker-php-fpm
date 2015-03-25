#
# PHP FPM FastCGI worker
#
# docker-build properties:
# TAG=barchart/php-fpm:latest

FROM barchart/base
MAINTAINER Jeremy Jongsma "jeremy@barchart.com"

# Install PHP
RUN apt-get -y update && \
	apt-get -y install php5 php5-dev php5-fpm php5-mysqlnd php5-xdebug php5-curl php5-json \
		php5-mcrypt php5-gd php5-json php5-memcached php-pear imagemagick && \
	pear install Mail_Mime Archive_Tar Auth Auth_SASL Console_Getopt Date mail Mail_mimeDecode Net_SMTP XML_RPC && \
	pecl install trader igbinary && \
	apt-get clean && \
	rm -rf /tmp/*

ADD etc/ /etc/

# Define mountable directories.
VOLUME ["/var/www"]

# Define working directory.
WORKDIR /var/www

# Expose ports.
EXPOSE 9000

# Define default command.
CMD ["/usr/sbin/php5-fpm","-F","-R"]
