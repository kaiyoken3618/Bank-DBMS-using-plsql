CREATE OR REPLACE PROCEDURE ADD_DATA
IS 
  
customer_id varchar2(30);
customer_name varchar2(30);
customer_street varchar2(30);
customer_city   varchar2(30); 
 
BEGIN 

 customer_id :='C11';
 customer_name :='MESSI';
 customer_street:='rosario';
 customer_city  :='bunes';  
 
 insert into CUSTOMER_SCHEMA VALUES(customer_id,customer_name,customer_street,customer_city); 
 commit; 
 
 DBMS_OUTPUT.PUT_LINE('DATA INSERTED SUCCESFULLY'); 
END; 
/ 


SET SERVEROUTPUT ON ;
SET VERIFY OFF;

DECLARE

BEGIN 
    ADD_DATA; 
END; 
/