#!/bin/sh
### BEGIN INIT INFO
# Provides           lgc-bff
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: docker bff
# Description:       Init script for the docker bff webservice
### END INIT INFO
#
# Author:   "lordgasmic" <lordgasmic@lordgasmic.com>
#
set -e

PATH=/bin:/usr/bin:/sbin:/usr/sbin

case "$1" in
  start)
    docker start bff
    ;;
  stop)
    docker stop bff
    ;;
  status)
    docker ps -f name=bff
    ;;
  force-reload|restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/lgc-bff {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
