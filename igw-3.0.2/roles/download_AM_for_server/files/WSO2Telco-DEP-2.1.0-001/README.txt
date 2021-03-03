================================================================
Patch ID     :  WSO2Telco-DEP-2.1.0-001
Public Jira  :  https://jira.wso2telco.com/jira/browse/INTGW-57
Description  :  This patch is related with the Error occurs when accessing workflow 
                for users having user roles with spaces
================================================================

Please perform below modifications to the current component-dep-support deployment to reflect the changes;

PRE-REQUISITES
--------------

System Requirements

a)Java SE Development Kit 1.8


INSTALLATION INSTRUCTIONS
-------------------------

1) If the server is started, shutdown it

2) Merge and Replace resources/manage/modules/taskmanager to <INTERNALGATEWAY_SERVER>/repository/deployment/server/jaggeryapps/manage/modules/taskmanager/

3) Restart the server with :
       Linux/Unix :  sh wso2server.sh
       Windows    :  wso2server.bat



