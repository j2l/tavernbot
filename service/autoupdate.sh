#!/bin/bash
set -e

###################################
# Set as a root cron job, with the
# correct path, and your bot will
# auto update if there's a version
# change (or any package change)
#
# I set mine for every 2 minutes with a daily log cleanup. Ex:
# 
# */2 *  *   *   * /path/to/your/updatescript.sh >> /var/log/botupdate.log 2>> /var/log/botupdate.log
# 0 2 * * * rm /var/log/botupdate.log
# 
# - jakerunsdnd
###################################

cd /path/to/tavernbot
cp package.json package.old
git pull > /dev/null 2> /dev/null
diff -w package.old package.json || systemctl restart tavernbot
