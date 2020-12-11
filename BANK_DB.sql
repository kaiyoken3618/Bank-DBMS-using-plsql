clear screen;

DROP TABLE Branch_schema CASCADE CONSTRAINTS;
DROP TABLE Loan_schema CASCADE CONSTRAINTS;
DROP TABLE Customer_schema CASCADE CONSTRAINTS;
DROP TABLE Borrower_schema CASCADE CONSTRAINTS;
DROP TABLE Customer_account_schema CASCADE CONSTRAINTS;
DROP TABLE Account_schema CASCADE CONSTRAINTS;
DROP TABLE Banker_info_schema CASCADE CONSTRAINTS;
DROP TABLE Banker_schema CASCADE CONSTRAINTS;

create table Branch_schema(
  branch_name varchar2(30),
  assets int,
  branch_city varchar2(30),
  PRIMARY KEY(branch_name)
 );

create table Customer_schema(
  customer_id varchar2(30),
  customer_name varchar2(30),
  customer_street varchar2(30),
  customer_city varchar2(30),
   PRIMARY KEY(customer_id)
 );

create table Account_schema(
  account_int int, 
  category varchar2(30),
  balance int, 
  PRIMARY KEY(account_int)
);

create table Banker_info_schema(
  banker_id varchar2(30) ,
  banker_name varchar2(30),
  branch_email varchar2(30),  
   PRIMARY KEY(banker_id)
);

create table Loan_schema(
  branch_name varchar2(30), 
  loan_int int,
  amount int, 
  PRIMARY KEY(loan_int),
  FOREIGN KEY(branch_name) REFERENCES Branch_schema(branch_name)
);

create table Borrower_schema(  
  customer_id varchar2(30),
  loan_int int NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES Customer_schema(customer_id),
  FOREIGN KEY(loan_int) REFERENCES Loan_schema(loan_int)
);

create table Customer_account_schema(
  customer_id varchar2(30),
  account_int int, 
  FOREIGN KEY(customer_id) REFERENCES Customer_schema(customer_id),  
  FOREIGN KEY(account_int) REFERENCES Account_schema(account_int) 
);

create table Banker_schema(
  branch_name varchar2(30),
  customer_id varchar2(30), 
  banker_id varchar2(30),
  FOREIGN KEY(branch_name) REFERENCES Branch_schema(branch_name), 
  FOREIGN KEY(customer_id) REFERENCES Customer_schema(customer_id), 
  FOREIGN KEY(banker_id) REFERENCES Banker_info_schema(banker_id) 
   );

insert into Branch_schema values('Dhaka-BANK', 6000000 ,'Dhaka');
insert into Branch_schema values('CHI-BANK', 12000000 ,'Chittagong');

insert into Loan_schema values('Dhaka-BANK', 1 , 150000);
insert into Loan_schema values('Dhaka-BANK', 2 , 20000);
insert into Loan_schema values('CHI-BANK', 3 , 80000);
insert into Loan_schema values('Dhaka-BANK', 4 , 1200000);
insert into Loan_schema values('Dhaka-BANK', 5 , 50000);
insert into Loan_schema values('CHI-BANK', 6 , 70000);
insert into Loan_schema values('Dhaka-BANK', 7 , 15000);
insert into Loan_schema values('CHI-BANK', 8 , 20000);

insert into Customer_schema values('C01','Ifti','farmgate','Nowakhali');
insert into Customer_schema values('C02','Deepok','mohammadpur','Nowakhali');
insert into Customer_schema values('C03','Mannan','bonani','Nowakhali');
insert into Customer_schema values('C04','Shipon','farmgate','Manikgonj');
insert into Customer_schema values('C05','Fahim','mohammadpur','B-Baria');
insert into Customer_schema values('C06','Papon','bonani','Nowakhali');
insert into Customer_schema values('C07','Khaled','mohammadpur','Comilla');
insert into Customer_schema values('C08','Mahin','khilgaw','B-Baria');
insert into Customer_schema values('C09','Salehin','shamoli','Foridpur');
insert into Customer_schema values('C10','Sakib','shamoli','Chittagong');  

insert into Account_schema values(1111, 'Taka', 10000.00);
insert into Account_schema values(1112, 'Taka', 500000.00);
insert into Account_schema values(1113, 'Taka', 20000.00);
insert into Account_schema values(1114, 'Taka', 10000.00);
insert into Account_schema values(1115, 'Taka', 500000.00);
insert into Account_schema values(1116, 'Taka', 2000.00);
insert into Account_schema values(1117, 'Taka', 10000.00);
insert into Account_schema values(1118, 'Taka', 500000.00);
insert into Account_schema values(1119, 'Taka', 2000.00);
insert into Account_schema values(1120, 'Taka', 12000.00);

insert into Customer_account_schema values('C01', 1111);
insert into Customer_account_schema values('C02', 1112);
insert into Customer_account_schema values('C03', 1113);
insert into Customer_account_schema values('C04', 1114);
insert into Customer_account_schema values('C05', 1115);
insert into Customer_account_schema values('C06', 1116);
insert into Customer_account_schema values('C07', 1117);
insert into Customer_account_schema values('C08', 1118);
insert into Customer_account_schema values('C09', 1119);
insert into Customer_account_schema values('C10', 1120);

insert into Borrower_schema values('C01',1);
insert into Borrower_schema values('C02',2);
insert into Borrower_schema values('C03',3);
insert into Borrower_schema values('C04',4);
insert into Borrower_schema values('C05',5);
insert into Borrower_schema values('C06',6);
insert into Borrower_schema values('C07',7);
insert into Borrower_schema values('C08',8);

insert into Banker_info_schema values('sta_fahim', 'Fahim', 'fahim@abcbank.com');
insert into Banker_info_schema values('sta_sakib', 'Sakib', 'sakib@abcbank.com');
insert into Banker_info_schema values('sta_papon', 'Papon', 'Papon@abcbank.com');

insert into Banker_schema values('Dhaka-BANK', 'C01', 'sta_fahim');
insert into Banker_schema values('Dhaka-BANK', 'C02', 'sta_fahim');
insert into Banker_schema values('Dhaka-BANK', 'C03', 'sta_fahim');
insert into Banker_schema values('Dhaka-BANK', 'C04', 'sta_sakib');
insert into Banker_schema values('Dhaka-BANK', 'C05', 'sta_sakib');
insert into Banker_schema values('CHI-BANK', 'C06', 'sta_papon');
insert into Banker_schema values('CHI-BANK', 'C07', 'sta_papon');
insert into Banker_schema values('CHI-BANK', 'C08', 'sta_papon');
insert into Banker_schema values('CHI-BANK', 'C09', 'sta_papon');
insert into Banker_schema values('CHI-BANK', 'C10', 'sta_papon');

commit;

-- query:
-- create table Loan_schema1 as select * from Loan_schema where branch_name = 'Dhaka-BANK';
-- create table Loan_schema2 as select * from Loan_schema where branch_name = 'CHI-BANK';  
-- Some functions: 1-> Find the customer name who has borrowed more than 10000 taka. Loan_schema, Borrower_schema, Customer_schema.
              --   2-> Find the customer who opened account in Chittagong branch. Customer_schema, Banker_schema. 
              --   3-> Display the customer his loan ammount. Customer_schema, Borrower_schema, Loan_schema.
              --   4-> Display customer name and their corresponding account number. Customer_schema, Customer_account_schema. 
              --   5-> Check who has more than 20,000 taka balance. 

              -- triger
             --trigger give error msg-(balance-widraw)<1000 else  "u can widraw." Table: Customer_account_schema, Account_schema
            -- @widraw := X