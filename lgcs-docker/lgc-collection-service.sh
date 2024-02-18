#!/bin/sh
### BEGIN INIT INFO
# Provides           lgc-collection-service
# Required-Start:    lgc-bff
# Required-Stop:     lgc-bff
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: docker collection-service
# Description:       Init script for the docker collection-service webservice
### END INIT INFO
#
# Author:   "lordgasmic" <lordgasmic@lordgasmic.com>
#
set -e

PATH=/bin:/usr/bin:/sbin:/usr/sbin

case "$1" in
  start)
    docker start collection-service
    ;;
  stop)
    docker stop collection-service
    ;;
  status)
    docker ps -f name=collection-service
    ;;
  force-reload|restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/lgc-collection-service {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
