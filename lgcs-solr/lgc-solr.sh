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
solr_var_dir=/var/solr

case "$1" in
  start)
    cd $solr_var_dir
    runuser -u solr -- /opt/solr/bin/solr start
    ;;
  stop)
    cd $solr_var_dir
    runuser -u solr -- /opt/solr/bin/solr stop
    ;;
  status)
    cd $solr_var_dir
    runuser -u solr -- /opt/solr/bin/solr status
    ;;
  force-reload|restart)
    cd $solr_var_dir
    runuser -u solr -- /opt/solr/bin/solr stop
    runuser -u solr -- /opt/solr/bin/solr start
    ;;
  *)
    echo "Usage: /etc/init.d/lgc-solr {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
