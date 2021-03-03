use proddepdb;

update operatorendpoints set endpoint='http://localhost:8181/smsmessaging/v1_2' where api='smsmessaging' and operatorid=1;
update operatorendpoints set endpoint='http://localhost:8181/payment/v1_3' where api='payment' and operatorid=1;
update operatorendpoints set endpoint='http://localhost:8181/location/v1' where api='location' and operatorid=1;
update operatorendpoints set endpoint='http://localhost:8181/ussd/v1' where api='ussd' and operatorid=1;

insert into operatorendpoints values (5,1,'customerinfo',1,'http://localhost:8181/customerinfo/v1',null,null,null,null);
insert into operatorendpoints values (6,1,'provisioning',1,'http://localhost:8181/provisioning/v1',null,null,null,null);
insert into operatorendpoints values (7,1,'credit',1,'http://localhost:8181/credit/v1',null,null,null,null);
insert into operatorendpoints values (8,1,'wallet',1,'http://localhost:8181/wallet/v1',null,null,null,null);





