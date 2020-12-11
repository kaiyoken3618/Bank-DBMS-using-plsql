create or replace function borrower(b1 out varchar2,b2 out varchar2)
	return varchar2
	is

borrower1 varchar2(20);
borrower2 varchar2(20);
begin

	select count(customer_id) into borrower1 from Borrower_schema@site_link1 ;
	select count(customer_id) into borrower2 from Borrower_schema@site_link2 ;
	
	b1:=borrower1;
	b2:=borrower2;
	
	return borrower1+borrower2;

end borrower;
/

set serveroutput on;

DECLARE
BEGIN
	borrower();
END;
/