create or replace procedure p1
IS

nam customer_schema.customer_name%TYPE;
bal account_schema.balance%TYPE;

CURSOR c1 is  select customer_schema.customer_name,account_schema.balance from customer_schema, account_schema join 
(select customer_schema.customer_name,customer_account_schema.account_int from customer_schema, customer_account_schema as R join
customer_account_schema on customer_schema.customer_id=customer_account_schema.customer_id) 
on R.account_int=account_schema.account_int;

BEGIN

OPEN c1;
	LOOP
	FETCH c1 into nam,bal;
	EXIT WHEN c1%notfound;
	DBMS_OUTPUT.PUT_LINE('person name : ' ||nam|| '    '||'Balance: '|| bal);

	END LOOP;
CLOSE c1;

end p1;
/

SET SERVEROUTPUT ON ;
SET VERIFY OFF;

DECLARE
    
BEGIN 
    p1; 
END; 
/
/*

select customer_schema.customer_name,account_schema.balance from account_schema join 
(select customer_schema.customer_name,customer_account_schema.account_int from customer_schema as R join
customer_account_schema as on customer_schema.customer_id=customer_account_schema.customer_id) on R.account_int=account_schema.account_int;
 

*/