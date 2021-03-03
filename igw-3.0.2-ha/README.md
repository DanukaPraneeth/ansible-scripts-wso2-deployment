#Ansible automation of Internal Gateway ( v2.1.0 ) deployement 

This is an ansile project to automate downloading the internal gateway products on servers, creating databases, configuring the product changes and start the pack. Products are deployed on four servers as follows.

---
* server 1 - database server ( contain all the databases )
* server 2 - API manager
* server 3 - Identity server with MIG as key manager and Sandbox
* server 5 - DAS
---


##Prerequisits for deployment
There are some prerequisits in the newly created servers to deploy the products ( eg: ansible, mysql. Java, Python, unzip etc ). These will be automatically installed during the execution of the playbooks.

But there are some prerequisits in the server on which the playbooks are being executed. Those needs to be fulfilled before executing the playbooks.
  
  1. Ansible
  --- 
     sudo apt install ansible
  ---
  2. Python boto
  ---
     sudo apt-get install python-pip 
     sodo pip install -U boto
  --- 
  3. sudo apt-get install sshpass


##Project layout
The product is deployed using four main playbooks and there are altogether 23 roles. 


* play1.yml - 1 roles
-  **install_servers_prerequisits_n_update_ip_addresses** ( install ansible on servers and update corresponding host variables in other roles )

* play2.yml - Download and configure products on newly created servers

1.  Database server - 3 roles
*   **download_prerequisites** - install java, mysql, unzip and python on the server
*   **import_products** - import required databases scripts
*   **create_DB** - create databases and run the database scripts ( database server will identify AM server, MIG server and DAS server using it's IP address, unique username and password. So If username or password of the server needs to be changed, the corresponding variable in each and every role should be updated before running the playbook, play2.yml. 

2.  API Manager server - 10 roles
*  **download_prerequisites**
*  **download_AM_for_server** - download the API manager product, patches etc
*  **configure_the_AM_gateway** - configure the API manager pack as gateway
*  **configure_the_AM_portal** - configure another API manager pack as portal
*  **MIG_configure_in_gateway** - MIG as key manager related configurations
*  **MIG_configure_in_portal** 
*  **configure_AM_gateway_security** - configure the changes correspond to the SSL certificates
*  **configure_AM_portal_security**
*  **DAS_configure_in_AM_gateway** - Changes correspond to the DAS interconnections
*  **DAS_configure_in_AM_gateway**

3.  DAS server - 5 roles
*  **download_prerequisites**
*  **download_DAS_for_server**
*  **configure_DAS**
*  **configure_DAS_security**
*  **start_DAS** 

4.  Mediation server - 4 roles
*  **download_prerequisites**
*  **download_mediation_for_server**
*  **configure_mediation**
*  **start_mediation**

5.  MIG server - 4 roles
*  **download_prerequisites** 
*  **download_MIG_for_server**
*  **configure_the_MIG**
*  **km_configuration_in_MIG**
*  **configure_MIG_security**
*  **start_MIG**

*Once the execution of the play2.yml is finished, you should log into the MIG server using a web browser and install the **MIG as keymanger** features. You may use the link, 
[mig as KM](http://docs.wso2telco.com/display/HG/Configuring+MIG) 
for this process. ( Please note that you have to follow only the step 2 and step 3 in the above link)*

* play4.yml - Configure the MIG as keymanger in the IS and install sandbox in the MIG server
*  **km_configuration_in_MIG**
*  **download_sandbox_for_server**
*  **configure_sandbox**
*  **start_sandbox**

*Once the execution of thr play3.yml is completed, log into the Activitiexplorer of the API manager and upload the workflow .bar files to complete the projuct installation* 


##Important facts
1. Before executing the play1.yml, you should update the host file with corresponding IPs under [AM_server_1],[MIG_server_1],[DAS_server_1] and [DB_server_M] and var file in the role "install_servers_prerequisits_n_update_ip_addresses".

2. Update the hostnames of servers correctly in the var file of the role "install_servers_prerequisits_n_update_ip_addresses" before executing play1.yml

3. Use the same variable values in the var folder of each interrelated roles.

4. Update the hosts and host file in each file with correct host names.

5. Replace the certificate files in the files folder of each security configuring role and update the password and alias used in generating the certificate files in the var folder.
 
6. *Once the execution of the play2.yml is finished, you should log into the MIG server using a web browser and install the **MIG as keymanger** features. You may use the link, 
[mig as KM](http://docs.wso2telco.com/display/HG/Configuring+MIG) 
for this process. ( Please note that you have to follow only the step 2 and step 3 in the above link)*

7. To start or stop the sandbox using the downloaded script, you should use the following command,
---
  sudo sh {{extract_location}}/sandbox.sh start {{product_version}}
  sudo sh {{extract_location}}/sandbox.sh stop {{product_version}}

  eg: sudo sh /mnt/sandbox.sh start 1.7.1
---

8. *Add the host name of the das server to the /etc/hosts of your local machine*

