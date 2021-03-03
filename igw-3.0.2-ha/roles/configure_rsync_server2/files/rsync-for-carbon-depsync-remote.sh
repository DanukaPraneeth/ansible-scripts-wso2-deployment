#!/bin/bash
# rsync-for-carbon-depsync.sh - Push file changes to the nodes.
RMLOGIN=USER@REMOTE_IP
RMROOTLOGIN=root@REMOTE_IP

local_portal=MY_PORTAL_LOCATION/repository/deployment/server/synapse-configs/default/
remote_potal=$RMLOGIN:REMOTE_PORTAL_LOCATION/repository/deployment/server/synapse-configs/default
LOG=/var/carbon-rsync-logs/"log-remote-$(date +%Y%m%d).log"

#delete the lock on exit
trap ' ssh $RMROOTLOGIN  rm -rf /var/rsync/.rsync.lock' EXIT
#Try to create lock
ssh $RMROOTLOGIN  ' touch /var/rsync/.rsync.lock'
if [ $? -ne 0 ] ; then
    echo  "lock exists " >> $LOG;
    exit 1
else
    echo "lock initiated"  >> $LOG;
fi

echo Syncing ========= $remote_potal >> $LOG;
rsync  --delete -rave  "ssh  -o StrictHostKeyChecking=no" $local_portal $remote_potal  >> $LOG
echo ================================================== >> $LOG;

if [ $? -ne 0 ] ; then
    echo "fatal delete"
else
    echo "success delete"
fi