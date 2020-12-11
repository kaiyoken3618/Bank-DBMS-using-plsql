CREATE OR REPLACE PROCEDURE emp_name (customer_id IN varchar2, branch_name OUT varchar2)
IS
BEGIN
    SELECT branch_name INTO bname
    FROM banker_schema WHERE customer_id = id;
END;
/


DECLARE
	branch_name varchar(20);
  	CURSOR id SELECT customer_id FROM banker_schema;
BEGIN
 FOR banker_schema in id
 LOOP
   emp_name(bancker_schema.customer_id, branch_name);
   dbms_output.putline('The  ' || branch_name || ' has ' || bancker_schema.customer_id);
 END LOOP;
 END; 
 /