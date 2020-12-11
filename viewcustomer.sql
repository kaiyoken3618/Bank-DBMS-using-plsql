

create or replace procedure p1 (cid in varchar2)
IS

nam varchar2(50);
bal number;

CURSOR c1 (cid varchar2) is
select customer_schema.customer_name,account_schema.balance from account_schema join 
(select customer_schema.customer_name,customer_account_schema.account_int from customer_schema join
customer_account_schema on customer_schema.customer_id=customer_account_schema.customer_id) on customer_schema.account_int=account_schema.account_int;

BEGIN

OPEN c1(cid);
	LOOP
	FETCH c1 INTO nam;
	EXIT WHEN c1%notfound;
	DBMS_OUTPUT.PUT_LINE('person name : ' ||nam|| '    '||'Balance: '|| bal);

	END LOOP;
CLOSE c1;

end p1;
/