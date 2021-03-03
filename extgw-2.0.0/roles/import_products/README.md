#Ansible automation of External Gateway deployement on cloud servers - Role name : import_products

##Important facts
* This role will
    - download APIM and MIG to the database server
    - copy two files from local repository to the DB server. They are inside the **files** folder of the role.
        - dbupdatefornewpack.sql
        - dep-sandbox1_7_0.sql
