#!/bin/sh
### BEGIN INIT INFO
# Provides           lgc-solr
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: solr
# Description:       Init script for solr
### END INIT INFO
#
# Author:   "lordgasmic" <lordgasmic@lordgasmic.com>
#
set -e

PATH=/bin:/usr/bin:/sbin:/usr/sbin

case "$1" in
  start)
    runuser -u solr -- solr start
    ;;
  stop)
    runuser -u solr -- solr stop
    ;;
  status)
    runuser -u solr -- solr status
    ;;
  force-reload|restart)
    runuser -u solr -- solr stop
    runuser -u solr -- solr start
    ;;
  *)
    echo "Usage: /etc/init.d/lgc-rabbit {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
