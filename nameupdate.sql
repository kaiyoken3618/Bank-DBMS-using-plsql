SET SERVEROUTPUT ON;

DECLARE
	c_id Customer_schema.customer_id %TYPE;
	c_name Customer_schema.customer_name %TYPE;
	c_city Customer_schema.customer_city %TYPE;
	c_newcity Customer_schema.customer_city %TYPE;
	var Customer_schema.customer_id %TYPE;

BEGIN
	c_newcity := &x;
	var := &y;
	update Customer_schema set customer_city = c_newcity
	where customer_id = var;
 
	select customer_id, customer_name, customer_city
	into c_id, c_name, c_city
	from Customer_schema
	where customer_id = var;
DBMS_OUTPUT.PUT_LINE('id' || ' ' ||'name'|| ' ' ||'city');
DBMS_OUTPUT.PUT_LINE(c_id || ' ' ||c_name|| ' ' ||c_city);

END;
/