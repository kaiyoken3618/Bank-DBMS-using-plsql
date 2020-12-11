SET SERVEROUTPUT ON

create or replace trigger trigger_log
after insert on Customer_schema
begin
	dbms_output.put_line('data inserted into Customer schema');
end;
/

create or replace trigger trigger_log1
after insert on Branch_schema
begin
	dbms_output.put_line('data inserted into Branch schema');
end;
/
create or replace trigger trigger_log2
after insert on Loan_schema
begin
	dbms_output.put_line('data inserted into Loan_schema');
end;
/

create or replace trigger trigger_log3
before insert on Borrower_schema
begin
	dbms_output.put_line('data inserted into Borrower_schema');
end;
/

create or replace trigger trigger_log4
after insert on Customer_account_schema
begin
	dbms_output.put_line('data inserted into Customer_account_schema');
end;
/
create or replace trigger trigger_log5
after insert on Account_schema
begin
	dbms_output.put_line('data inserted into Account_schema');
end;
/

create or replace trigger trigger_log6
after insert on Banker_info_schema
begin
	dbms_output.put_line('data inserted into Banker_info_schema');
end;
/
create or replace trigger trigger_log7
after insert on Banker_schema
begin
	dbms_output.put_line('data inserted into Banker_schema');
end;
/
