CREATE OR REPLACE TRIGGER account_balance
    AFTER 
    UPDATE 
    ON account_schema
    FOR EACH ROW    
DECLARE
   
BEGIN
    
	 dbms_output.put_line('widraw possible');
          
   END;
   / 
  
SET SERVEROUTPUT ON ; 
 
DECLARE  
 X number; 
 Y number;   
 Z number;
 
 widraw number:= &widraw;   
 cursor hello is select balance from account_schema;
 
  
 
BEGIN  
  
 open hello; 
 loop   
    
	 fetch hello into Z; 
	 exit when hello%NOTFOUND;
	  
	 Y := Z - widraw; 
	  
	 IF(Y>1000)then 
               	 
        update account_schema set balance=Y ;   
		 
     else 
        dbms_output.put_line('u cannot windraw');
     end if;     		
 end loop;
close hello;       
END; 
/ 
 
 