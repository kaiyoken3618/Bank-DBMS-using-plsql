create or replace procedure searchByBorrower
is
	cid varchar2(50);
	lid int;
	cname varchar2(50);
	
	cursor c1 is 
		(select c.cusid,s.roomid,c.cusname,c.gender 
		from Customer c
		inner join StatusOfRoom s on c.cusid=s.cusid where c.gender='Female')

	   

begin

	DBMS_OUTPUT.PUT_LINE('CustomerId'||' '||'  RoomId'||'  '||' Gender'||'       '||' Name');
	
	open c1;
	loop
		fetch c1 into cusid,roomid,cusname,gender;
		exit when c1%notfound;
		DBMS_OUTPUT.PUT_LINE(cusid||'             '||roomid||'      '||gender||'        '||cusname);
	end loop;
	
end searchByGenderFemale;
/