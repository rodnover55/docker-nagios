#!/bin/bash
service fcgiwrap start
service php5-fpm start
exec /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
