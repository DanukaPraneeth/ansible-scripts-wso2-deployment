#Ansible automation of External Gateway deployement on cloud servers - Role name : configure_the_AM


##Important facts
* This role copy a file from local repository to the AM server. They are inside the **files** folder of the role.
*  mysql-connector-java-5.1.40-bin.jar


##Important configurations

After running the DAS roles, follow the given steps to configure the login fo the das portal

* Changes for carbon.xml
    Enable
        HostName
        MgtHostName
* Add the host name to the /etc/hosts
* When changing hostname after installing the new certificates you have to enable the hostname in carbon.xml file and add the corresponding hostname. Also in repository/conf/dashboards/portal.json file the hostname has to be set as null
    "host": {
            "hostname": "",
            "port": "",
            "protocol": ""
        }
