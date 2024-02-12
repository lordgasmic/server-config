#!/bin/sh
### BEGIN INIT INFO
# Provides           lgc-rabbitmq
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: rabbit mq
# Description:       Init script for the rabbit mq
### END INIT INFO
#
# Author:   "lordgasmic" <lordgasmic@lordgasmic.com>
#
set -e

PATH=/bin:/usr/bin:/sbin:/usr/sbin

case "$1" in
  start)
    systemctl start rabbitmq-server
    ;;
  stop)
    systemctl stop rabbitmq-server
    ;;
  status)
    rabbitmq-diagnostics status
    ;;
  force-reload|restart)
    systemctl stop rabbitmq-server
    systemctl start rabbitmq-server
    ;;
  *)
    echo "Usage: /etc/init.d/lgc-rabbit {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
