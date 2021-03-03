#!/bin/sh -ex
#source folder
portal=MY_PORTAL_LOCATION/repository/deployment/server/synapse-configs/default/
#Destination folder
gateway=MY_GATEWAY_LOCATION/repository/deployment/server/synapse-configs/default
LOG=/var/carbon-rsync-logs/"log-local-$(date +%Y%m%d_%H%M%S).log"

#keep a lock to stop parallel runs
(
flock -e 10
echo " ========== $(date -Iseconds) Lock acquired by local thread MY_IP =========== " >> $LOG
rsync --delete -arv $portal   $gateway  >>  $LOG
) 10> /var/rsync/.rsync.lock
echo " ========== $(date -Iseconds) Release Lock acquired by local thread MY_IP =========== " >> $LOG

sh REMOTE_SH_PATH/rsync-for-carbon-depsync-remote.sh