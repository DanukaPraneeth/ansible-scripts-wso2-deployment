#Ansible automation of External Gateway deployement on cloud servers - Role name : download_sandbox_for_server

##Important facts
* This role copy two files from local repository to the DB server. They are inside the **files** folder of the role.
*  sandbox-service-bin-1.7.1.zip
*  sandbox.sh - this is to start and stop the sandbox service 

*  **If you are changing the default 'file path' or 'extract path' variables in the sandbox-service related ansible roles, you have to change the following variables accordingly in the 'sandbox.sh' file written to start and stop the sandbox service**
*   PATH_TO_JAR
*   PID_PATH_NAME
*   PATH_TO_CONFIG

*  So it is always safe to use the same extract locations for all the products files ( wso2telcoids, sandbox-service, sandbox.sh ) in the MIG server.

*  If you manually start the sandbox service using the sandbox.sh script, you should either remove any 'sandbox-pid' directory created or stop the sandbox-service using the following command which will automatically remove the 'sandbox-pid' folder. 
   ---
   sudo sh /mnt/sandbox.sh stop 1.7.1
   --- 
