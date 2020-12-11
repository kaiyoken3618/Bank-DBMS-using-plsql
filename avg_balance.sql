CREATE OR REPLACE FUNCTION avgBalance
RETURN number 
IS    
     abalance number := 0;
BEGIN 
   SELECT Avg(balance) into abalance
	FROM Account_schema;
    
   RETURN abalance; 
END avgBalance;
/


 SET SERVEROUTPUT ON;
 DECLARE 
  b number;
BEGIN    
   b := avgBalance();   
   dbms_output.put_line('Average balance of Customer in Bank: ' || b); 
END; 
/
 