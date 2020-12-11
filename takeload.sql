SET SERVEROUTPUT ON;

DECLARE
	b_id Borrower_schema.customer_id %TYPE;
	b_ln Borrower_schema.loan_int %TYPE;
	ln_br Loan_schema.branch_name %TYPE;
	ln_id Loan_schema.loan_int %TYPE;
	ln_am Loan_schema.amount %TYPE;

BEGIN
	b_id := &x;
	b_ln := &y;
	ln_br := &z;
	ln_id := b_ln;
	ln_am := &p;

    insert into Borrower_schema set customer_id = b_id
 
	select customer_id, customer_name, customer_city
	into c_id, c_name, c_city
	from Customer_schema
	where customer_id = var;

DBMS_OUTPUT.PUT_LINE(c_id);
DBMS_OUTPUT.PUT_LINE(c_name);
DBMS_OUTPUT.PUT_LINE(c_city);

END;
/