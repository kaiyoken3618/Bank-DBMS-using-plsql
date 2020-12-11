CREATE OR REPLACE FUNCTION totalCustomer
RETURN number 
IS    
     total number(2) := 0;
BEGIN 
      SELECT count(*) into total 
   FROM  Customer_schema; 
    
   RETURN total; 
END totalCustomer;
/


SET SERVEROUTPUT ON;
DECLARE 
   a number;
BEGIN    
   a := totalCustomer();   
   dbms_output.put_line('Total Customer in Bank: ' || a); 
END; 
/
 