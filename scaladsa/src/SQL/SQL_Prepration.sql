-- Question1 : write a sql to find min and max value of continuous sequence in each group

create table min_max_group(group_name varchar, id int);

insert into min_max_group values ('A',1);
insert into min_max_group values ('A',2);
insert into min_max_group values ('A',3);
insert into min_max_group values ('A',5);
insert into min_max_group values ('A',6);
insert into min_max_group values ('A',7);
insert into min_max_group values ('A',9);
insert into min_max_group values ('A',11);
insert into min_max_group values ('B',1);
insert into min_max_group values ('C',1);
insert into min_max_group values ('C',2);
insert into min_max_group values ('C',3);


with cte as (select  group_name , id , row_number() Over(partition by group_name order by id asc )rk,
(id - row_number() Over(partition by group_name order by id asc ) )group_split
from min_max_group)

select group_name,min(id), max(id) from cte group by group_name , group_split  order by group_name

/*
group_name	min	max
A			11	11
A			1	3
A			5	7
A			9	9
B			1	1
C			1	3
*/



/*
 * Question 2 Student Table has three columns Student_Name, Total_Marks and Year.
 * User has to write a SQL query to display Student_Name, Total_Marks, Year,
 * Prev_Yr_Marks for those whose Total_Marks are greater than or equal to the previous year.
*/
CREATE TABLE Student(
Student_Name  varchar(30),
Total_Marks  int ,
Year  int)

INSERT INTO Student VALUES('Rahul',90,2010);
INSERT INTO Student VALUES('Sanjay',80,2010);
INSERT INTO Student VALUES('Mohan',70,2010);
INSERT INTO Student VALUES('Rahul',90,2011);
INSERT INTO Student VALUES('Sanjay',85,2011);
INSERT INTO Student VALUES('Mohan',65,2011);
INSERT INTO Student VALUES('Rahul',80,2012);
INSERT INTO Student VALUES('Sanjay',80,2012);
INSERT INTO Student VALUES('Mohan',90,2012);



with cte as (select *, lag(total_marks) Over(partition by student_name order by year ) as Prev_Yr_Marks from student),
cte2 as (select * , case when total_marks>= Prev_Yr_Marks then 1 else 0 end as flag from cte)
select  Student_Name, Total_Marks, Year,   Prev_Yr_Marks from cte2 where flag=1



/* Question 3 :
 * Emp_Details  Table has four columns EmpID, Gender, EmailID and DeptID. User has to write a
 * SQL query to derive another column called Email_List to display all Emailid
 * concatenated with semicolon associated with a each DEPT_ID  as shown below in output Table.
*/

CREATE TABLE Emp_Details (
EMPID int,
Gender varchar,
EmailID varchar(30),
DeptID int)


INSERT INTO Emp_Details VALUES (1001,'M','YYYYY@gmaix.com',104);
INSERT INTO Emp_Details VALUES (1002,'M','ZZZ@gmaix.com',103);
INSERT INTO Emp_Details VALUES (1003,'F','AAAAA@gmaix.com',102);
INSERT INTO Emp_Details VALUES (1004,'F','PP@gmaix.com',104);
INSERT INTO Emp_Details VALUES (1005,'M','CCCC@yahu.com',101);
INSERT INTO Emp_Details VALUES (1006,'M','DDDDD@yahu.com',100);
INSERT INTO Emp_Details VALUES (1007,'F','E@yahu.com',102);
INSERT INTO Emp_Details VALUES (1008,'M','M@yahu.com',102);
INSERT INTO Emp_Details VALUES (1009,'F','SS@yahu.com',100);


select DeptID, string_agg(emailid,'|'  order by emailid ) from Emp_Details group by DeptID



/* Question4 :
 * (a) Write a SQL to get all the products that got sold on both the days and the number of times the product is sold.
 * (b) Write a SQL to get products that was ordered on 02-May-2015 but not on 01-May-2015
 */


CREATE TABLE Order_Tbl(
 ORDER_DAY date,
 ORDER_ID varchar(10) ,
 PRODUCT_ID varchar(10) ,
 QUANTITY int ,
 PRICE int
) ;

INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR1', 'PROD1', 5, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR2', 'PROD2', 2, 10);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR3', 'PROD3', 10, 25);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR4', 'PROD1', 20, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR5', 'PROD3', 5, 25);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR6', 'PROD4', 6, 20);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR7', 'PROD1', 2, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR8', 'PROD5', 1, 50);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR9', 'PROD6', 2, 50);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR10','PROD2', 4, 10);


-- Solution part 1
with cte as (select count(distinct order_day), count(order_id)as product_sold, product_id from Order_Tbl
		group by product_id having count(distinct order_day)>1)
		select product_id , product_sold from cte;

-- Solution part 2
select product_id from Order_Tbl where product_id not in(
select distinct product_id from Order_Tbl where order_day = '2015-05-01');

-- Solution part 2 by using join
 select A.product_id from  (
(select product_id from Order_Tbl where order_day = '2015-05-02')A
left join
(select product_id from Order_Tbl where order_day = '2015-05-01') B
on
A.product_id = B.product_id
)
where
B.product_id is null


-- Solution part 2 by using expect query

select product_id from Order_Tbl where order_day = '2015-05-02'
except
select product_id from Order_Tbl where order_day = '2015-05-01'


/* Questio5 :
 * 	(a) Write a SQL to get the highest sold Products (Quantity*Price) on both the days
	(b) Write a SQL to get all product's  total sales on 1st May and 2nd May adjacent to each other
	(c) Write a SQL to get all products day wise, that was ordered more than once

 * */

-- (a) Solution 1 : with row_number
with cte as (select order_day, product_id,sum(Quantity*Price)as soldAmmount
from Order_Tbl group by order_day,product_id),
cte2 as (select order_day, product_id, soldAmmount, row_number() over(partition by order_day order by soldAmmount desc)rk
from cte)
select product_id,soldAmmount, order_day from cte2 where rk=1

-- (a) Solution 2 : with join
select A.order_day,B.Product_id, A.sold_amount from
(select  order_day, max(Quantity*Price) as sold_amount from Order_Tbl group by order_day) A
inner join
(select  order_day,product_id,  max(Quantity*Price)as sold_amount from Order_Tbl group by order_day,product_id) B
on A.order_day=B.order_day and A.sold_amount= B.sold_amount


-- (b) Solution 1 :
with cte as (select order_day , product_id, sum(Quantity*Price) as total_sales from Order_Tbl group by order_day , product_id),
cte2 as ( select product_id, total_sales as "2015-05-01", lead(total_sales) Over(partition by product_id) as "2015-05-02"  from cte)
select * from cte2 where "2015-05-02" is not null;

-- (c) Solution 1 :

select order_day, product_id, count(1) from Order_Tbl group by 1,2
having count(1)>1;


--Question 6: Write a SQL which will explode the above data into single unit level records


with recursive cte(order_id,product_id,Quantity,val) as
		(select order_id, product_id, Quantity, 1 as val from Order_Tbl
        	 union all
         	select c.order_id, c.product_id, c.Quantity-1, c.val from Order_Tbl
         join cte c on
         Order_Tbl.order_id=c.order_id and
         Order_Tbl.product_id=c.product_id and
         c.Quantity>1
          )
select order_id,product_id,val as Quantity1,Quantity
from cte where cte.product_id='PROD1'  and cte.order_id='ODR1'
order by 1,2


--Question 7: Write a SQL  to find all Employees who earn more than the average salary in their corresponding department.

--drop table emp

CREATE TABLE emp (
    empno           integer NOT NULL CONSTRAINT emp_pk PRIMARY KEY,
    ename           varchar,
    job             varchar,
    mgr             integer,
    hiredate        DATE,
    sal            float CONSTRAINT emp_sal_ck CHECK (sal > 0),
    comm           integer,
    deptno          integer

);

INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,NULL,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,'03-DEC-81',3000,NULL,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);


with cte as (select * , avg(sal) over(partition by deptno) avg_sal from emp)
select * from cte where sal>avg_sal


--Question 8 :Write a SQL which will fetch total schedule of matches between each Team vs opposite team:
drop table team;

create table team (id integer,team_name varchar);
INSERT INTO team VALUES (1,'INDIA');
INSERT INTO team VALUES (2,'AUS');
INSERT INTO team VALUES (3,'SRILANKA');
INSERT INTO team VALUES (4,'NEWZLAND');


select concat(A.team_name,' VS ', B.Team_name) from TEAM A inner join
Team B on A.id<B.id


--Quesiton 9: Write SQL to display total number of matches played, matches won, matches tied and matches lost for each team
create table teams_result (
team1 varchar,
team2 varchar,
result varchar);

Insert into teams_result values('India','Pakistan','India');
Insert into teams_result values('India','Pakistan','India');
Insert into teams_result values('India','Srilanka','India');
Insert into teams_result values('Bangaladesh','Pakistan','Pakistan');
Insert into teams_result values('Bangaladesh','Pakistan',null);
Insert into teams_result values('Srilanka','Bangaladesh','Srilanka');
Insert into teams_result values('Bangaladesh','India','India');



--Total matches played by team

with total_match as (select sum(played_matches)total_match, team from (
select count(*) played_matches , team1 as team from teams_result group by team1
union
select count(*) played_matches, team2 as team from teams_result group by team2
) S group by team),

--Total matches won by team
won as (select count(*)as won, result as team from teams_result where result is not null  group by result),

--Matches got tied

tie_matches as (select sum(played_matches) as tie , team from (
select count(*) played_matches , team1 as team from teams_result where result is null group by team1
union
select count(*) played_matches, team2 as team from teams_result  where result is null group by team2
) S group by team)

select a.team, total_match, coalesce(won,0) as won ,
(total_match - coalesce(won,0)) loss,
coalesce(tie,0) tie
from total_match a
left join tie_matches b on
a.team=b.team
left  join won c on
a.team=c.team
order by won desc;


--Question 10 :
/*
(1.) As a convention the values in first_name and last_name should always be in uppercase. But due to data entry
	 issues some records may not adhere to this convention.
	 Write a query to find all such records where first_name is not in upper case.
(2.) For some records the first_name column has full name and last_name is blank.  Write a SQL query to update it correctly,
(3.) Calculate tenure of employees as of 30th Jun 2017. Prepare following above sample report :
(4.) List all the employees whose work anniversary is same as their birthday date.
(5.) Find the Youngest (minimum age) employee with tenure more than 5 years as of 30th June 2017.
 */
Create Table Employees
(
Employee_no integer,
Birth_date Date,
First_name Varchar,
Last_name Varchar,
Joining_date Date
)

INSERT INTO Employees Values(1001,CAST('1988-08-15' AS Date),'ADAM','WAUGH', CAST('2013-04-12' AS Date));
INSERT INTO Employees Values(1002,CAST('1990-05-10' AS Date),'Mark','Jennifer', CAST('2010-06-25' AS Date));
INSERT INTO Employees Values(1003,CAST('1992-02-07' AS Date),'JOHN','Waugh', CAST('2016-02-07' AS Date));
INSERT INTO Employees Values(1004,CAST('1985-06-12' AS Date),'SOPHIA TRUMP','', CAST('2016-02-15' AS Date));
INSERT INTO Employees Values(1005,CAST('1995-03-25' AS Date),'Maria','Gracia', CAST('2011-04-09' AS Date));
INSERT INTO Employees Values(1006,CAST('1994-06-23' AS Date),'ROBERT','PATRICA', CAST('2015-06-23' AS Date));
INSERT INTO Employees Values(1007,CAST('1993-04-05' AS Date),'MIKE JOHNSON','', CAST('2014-03-09' AS Date));
INSERT INTO Employees Values(1008,CAST('1989-04-05' AS Date),'JAMES','OLIVER', CAST('2017-01-15' AS Date));
INSERT INTO Employees Values(1007,CAST('1993-04-05' AS Date),'GREG WILLSON','', CAST('2014-03-09' AS Date));


-- Write a query to find all such records where first_name is not in upper case.
select * from employees where upper(first_name) != first_name ;
--For some records the first_name column has full name and last_name is blank.  Write a SQL query to update it correctly,

select split_part(first_name,' ',1) as first_name,split_part(first_name,' ',2) as last_name
from employees where last_name is null or last_name ='';

update employees
set first_name = split_part(first_name,' ',1),
last_name = split_part(first_name,' ',2)
where last_name is null or last_name ='';

select * from employees

--Calculate tenure of employees as of 30th Jun 2017. Prepare following above sample report :
select employee_no, joining_date,age('2017-06-30'::date,joining_date) as tenure from employees


-- Find the Youngest (minimum age) employee with tenure more than 5 years as of 30th June 2017.
with cte as (select employee_no,Birth_date, joining_date,extract('YEAR' from age('2017-06-30'::date,joining_date)) as tenure from employees)
select employee_no, MIN(AGE('2017-06-30'::date, Birth_date))
from cte
where   tenure  >=5
group by employee_no


--Quesiton 11:
/*
 * Ruby is a teacher in a school and she has created a table called SeatArrangement which stores
 * Student’s name and corresponding seat ids. Column id is continuous increment.
 * Now Ruby wants to change the seats for adjacent seats. Write a SQL query to output the result for Ruby.
 * */
Create Table SeatArrangement (
ID integer,
StudentName Varchar
);

Insert into SeatArrangement Values (1,'Emma');
Insert into SeatArrangement Values (2,'John');
Insert into SeatArrangement Values (3,'Sophia');
Insert into SeatArrangement Values (4,'Donald');
Insert into SeatArrangement Values (5,'Tom');


select StudentName, id as old_seat,
case when id %2 <>0 and id = (select count(*)as tot from seatarrangement )	then id
	 when id %2 <>0 then id+1
	 when id %2 = 0 then id-1
	 end as New_Seat
from seatarrangement


--Question : 12 Pivote

CREATE TABLE IF NOT EXISTS products(
  product_id int PRIMARY KEY,
  product_name varchar(255) NOT NULL
  );

CREATE TABLE IF NOT EXISTS customers(
  customers_id int PRIMARY KEY,
  customers_name varchar(255) NOT NULL
  );

CREATE TABLE IF NOT EXISTS product_customers(
  product_customers int PRIMARY KEY,
  product_id int NOT NULL REFERENCES products(product_id),
  customers_id int NOT NULL REFERENCES customers(customers_id),
  cost decimal(18,2)
  );

 --
-- Inserting data into table customers
--
INSERT INTO customers(customers_id, customers_name) VALUES
(1, 'Yadira Villanueva'),
(2, 'Britta Ayres'),
(3, 'Bernard Creighton'),
(4, 'Merle Reiter'),
(5, 'Wilfredo Southern'),
(6, 'April Fife'),
(7, 'Vivienne Goodson'),
(8, 'Dorian Conaway'),
(9, 'Leonila Malone'),
(10, 'Ali Darling'),
(11, 'Francis Shannon'),
(12, 'Moises Adame'),
(13, 'Aubrey Boyce'),
(14, 'Erasmo Abel'),
(15, 'Tamika Wampler'),
(16, 'Geoffrey Hammonds'),
(17, 'Garth Vasquez'),
(18, 'Loree Wooden'),
(19, 'Sherly Prewitt'),
(20, 'Ward King');


--
-- Inserting data into table products
--
INSERT INTO products(product_id, product_name) VALUES
(1, 'Tweetholdar'),
(2, 'Promuton'),
(3, 'Transniollor'),
(4, 'Cleanputon'),
(5, 'Tabwoofphone'),
(6, 'Supceivra'),
(7, 'Supputommar'),
(8, 'Mictellar'),
(9, 'Armlififiator'),
(10, 'Monoculimry');

--
-- Inserting data into table product_customers
--
INSERT INTO product_customers(product_customers, product_id, customers_id, cost) VALUES
(832507484, 7, 12, 599.86),
(334131854, 9, 14, 666.71),
(1382965572, 6, 9, 894.33),
(1597713938, 9, 8, 848.85),
(2147483647, 6, 6, 508.04),
(1382965573, 2, 10, 638.58),
(617759119, 6, 13, 146.08),
(119383489, 10, 15, 231.77),
(1597713939, 5, 12, 998.12),
(832507485, 5, 17, 871.91),
(1010667740, 8, 2, 584.01),
(1225416106, 5, 16, 132.37),
(334131855, 1, 11, 332.42),
(617759120, 3, 19, 985.13),
(119383490, 4, 17, 438.44),
(1382965574, 4, 16, 688.49),
(1010667741, 6, 20, 888.06),
(334131856, 2, 4, 251.12),
(1964703150, 9, 4, 192.81),
(119383491, 9, 2, 681.65),
(334131857, 4, 4, 359.05),
(119383492, 3, 13, 731.14),
(1225416107, 1, 16, 385.05),
(1010667742, 2, 6, 397.35),
(832507486, 2, 4, 455.02),
(1597713940, 5, 2, 144.45),
(1225416108, 2, 1, 99.66),
(617759121, 10, 9, 640.5),
(1382965575, 10, 19, 504.89),
(334131858, 10, 10, 270.2),
(1749954789, 8, 2, 370.35),
(1964703151, 7, 17, 940.91),
(1749954790, 4, 1, 749.38),
(832507487, 8, 11, 558.63),
(1010667743, 7, 13, 111.01),
(1225416109, 6, 11, 934.01),
(1597713941, 1, 3, 865.3),
(119383493, 10, 11, 357.16),
(617759122, 2, 10, 208.68),
(1964703152, 3, 17, 716.09),
(1010667744, 8, 20, 442.94),
(832507488, 10, 16, 951.76),
(617759123, 7, 13, 745.16),
(832507489, 10, 5, 415.05),
(1225416110, 1, 7, 703.27),
(1749954791, 10, 2, 744.43),
(1010667745, 6, 7, 108.73),
(1964703153, 10, 6, 575.47),
(1749954792, 2, 5, 135.86),
(1225416111, 2, 16, 611.66),
(1382965576, 5, 4, 804.67),
(617759124, 2, 5, 497.38),
(1597713942, 3, 1, 178.92),
(334131859, 1, 4, 642.2),
(832507490, 2, 18, 946.02),
(1964703154, 3, 20, 966.92),
(1749954793, 6, 5, 629.9),
(617759125, 8, 15, 118.94),
(832507491, 4, 9, 775.5),
(1964703155, 8, 19, 426.35);


--Pivote

with cte as (select product_id,sum(cost) total from product_customers group by 1)

select p.product_name,c.total from products p join cte c on
p.product_id= c.product_id




--Question 13 :
--Table Creation:
Create Table Inventory(
ProdName varchar,
ProductCode varchar,
Quantity int,
InventoryDate Date)

--INSERT Scripts:calculate running total with SQL.

Insert Into Inventory values('Keyboard','K1001',20,'2020-03-01');
Insert Into Inventory values('Keyboard','K1001',30,'2020-03-02');
Insert Into Inventory values('Keyboard','K1001',10,'2020-03-03');
Insert Into Inventory values('Keyboard','K1001',40,'2020-03-04');
Insert Into Inventory values('Laptop','L1002',100,'2020-03-01');
Insert Into Inventory values('Laptop','L1002',60,'2020-03-02');
Insert Into Inventory values('Laptop','L1002',40,'2020-03-03');
Insert Into Inventory values('Monitor','M5005',30,'2020-03-01');
Insert Into Inventory values('Monitor','M5005',20,'2020-03-02');


--solution using partition by
select *,sum(quantity) over(partition by ProdName order by inventorydate) from Inventory;

--solution 2
select a.prodname,a.inventorydate, sum(b.quantity) from inventory a  join inventory b
on a.inventorydate >= b.inventorydate and a.prodname = b.prodname
group by a.prodname, a.inventorydate
 ORDER BY
 a.prodname , a.inventorydate asc

 --Quetion 14 : How to Print Alphabets A to Z in SQL

select chr(65)
select chr(ascii('A'))


with recursive alphabet as (
select chr(ascii('A')) as letter
union all
select chr(ascii(letter)+1) as letter from alphabet
where letter <> 'Z'
)
select * from alphabet

--Question 15: print  Prime Number

with recursive prime as (
select 2 as num
union all
select num+1 as num from prime where
num <50
)
select * from prime a
where not exists (select 1 from prime b  where a.num % b.num =0 and a.num != b.num );

--Question 16 : How to print Fibonacci Series in SQL

with recursive fibbo as (
select 0 as FirstNum , 1 as SecondNum, 1 as step -- base querry
union all
select SecondNum , SecondNum+FirstNum , Step+1 from fibbo
where step<10
)
select * from fibbo

--Question 17: Get the Net Balance derived from Amount depending upon Debit and Credit.

Create Table Account_Table(
TranDate timestamp,
TranID Varchar,
TranType Varchar,
Amount Float);

INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-12T05:29:44.120', 'A10001','Credit', 50000);
INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-13T10:30:20.100', 'B10001','Debit', 10000);
INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-13T11:27:50.130', 'B10002','Credit', 20000);
INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-14T08:35:30.123', 'C10001','Debit', 5000);
INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-14T09:43:51.100', 'C10002','Debit', 5000);
INSERT into Account_Table (TranDate, TranID, TranType, Amount) VALUES ('2020-05-15T05:51:11.117', 'D10001','Credit', 30000);


select TranDate,TranID,TranType,Amount,sum(tempamount) over(order by TranDate) as NetBalance
from (
select *,
	case when trantype ='Credit' then amount
		when trantype = 'Debit' then amount * -1 end as TempAmount
		from account_table) S;



--Question : 18 Write SQL to derive Start_Date and End_Date column when there is continuous amount in Balance column

	Create Table BalanceTbl(
Balance int,
Dates Date
);

Insert into BalanceTbl Values(26000,'2020-01-01');
Insert into BalanceTbl Values(26000,'2020-01-02');
Insert into BalanceTbl Values(26000,'2020-01-03');
Insert into BalanceTbl Values(30000,'2020-01-04');
Insert into BalanceTbl Values(30000,'2020-01-05');
Insert into BalanceTbl Values(26000,'2020-01-06');
Insert into BalanceTbl Values(26000,'2020-01-07');
Insert into BalanceTbl Values(32000,'2020-01-08');
Insert into BalanceTbl Values(31000,'2020-01-09');

with balance_cte as (select *,
lag(balance)over (Order by dates),
case when lag(balance)over (Order by dates) = balance then 0 else 1 end as tempSeq from BalanceTbl
),
balance_seq	as (
select balance , dates , sum(tempSeq) over (order by dates )as seq from balance_cte
)

select balance ,min(dates) start_Date, max(dates)end_date, seq from balance_seq group by seq,balance



--Quetion 19:  Write SQL to get Total  sales amount in USD for each sales date as shown below :-

Table and Insert Scripts:

Create Table Sales_Table(
Sales_Date Date,
Sales_Amount Bigint,
Currency Varchar(10)
)

INSERT INTO Sales_Table Values ('2020-01-01',500,'INR');
INSERT INTO Sales_Table Values ('2020-01-01',100,'GBP');
INSERT INTO Sales_Table Values ('2020-01-02',1000,'INR');
INSERT INTO Sales_Table Values ('2020-01-02',500,'GBP');
INSERT INTO Sales_Table Values ('2020-01-03',500,'INR');
INSERT INTO Sales_Table Values ('2020-01-17',200,'GBP');

CREATE TABLE ExchangeRate_Table(
 Source_Currency varchar (10) ,
 Target_Currency varchar (10),
 Exchange_Rate float ,
 Effective_Start_Date date
)

INSERT into ExchangeRate_Table VALUES ('INR','USD', 0.014,'2019-12-31');
INSERT  into ExchangeRate_Table VALUES ('INR','USD', 0.015,'2020-01-02');
INSERT  into ExchangeRate_Table VALUES ('GBP','USD', 1.32, '2019-12-20');
INSERT into  ExchangeRate_Table VALUES ('GBP','USD', 1.3, '2020-01-01' );
INSERT  into ExchangeRate_Table VALUES ('GBP','USD', 1.35, '2020-01-16');


select * from ExchangeRate_Table;
select * from Sales_Table;


with cte as (select source_currency, exchange_rate,effective_start_date,
COALESCE((lead(effective_start_date)Over(partition by source_currency order by effective_start_date )
- INTERVAL '1 DAY')::date,'9999-12-31'::date)
as effective_end_date
from ExchangeRate_Table )

select sales_date , sum(Exchange_Rate * Sales_Amount) as total_amount from
(
(select * from Sales_Table) A
 inner join
cte on
A .Currency = cte.source_currency
and
A .Sales_Date >= effective_start_date and
A .Sales_Date <= effective_end_date
)  s group by sales_date



--question 20 : Write SQL to get unique combination of  two columns Source and

Create Table Travel_Table(
Start_Location Varchar(30),
End_Location Varchar(30),
Distance int)

Insert into Travel_Table Values('Delhi','Pune',1400);
Insert into Travel_Table Values('Pune','Delhi',1400);
Insert into Travel_Table Values('Bangalore','Chennai',350);
Insert into Travel_Table Values('Mumbai','Ahmedabad',500);
Insert into Travel_Table Values('Chennai','Bangalore',350);
Insert into Travel_Table Values('Patna','Ranchi',300);

select * from Travel_Table where Start_Location< End_Location
union
select * from Travel_Table A where not exists
(select 1 from Travel_Table B where A.Start_Location = B.End_Location)

--question 21 Write a SQL to find the missing ID  From sample Table

Create Table Sample_Table(
ID int)

Insert into Sample_Table Values (1),(4),(7),(9),(12),(14),(16),(17),(20)

select * from Sample_Table


with recursive cte_b as (
select min(id) id from Sample_Table A -- Base Query
union all
select B.Id+1 from cte_a A inner join cte_b B  -- Reccursive Query
on B.id < A.max_value
),
cte_a as (select max(id) as max_value from Sample_Table)

select cte_b.id  from cte_b  where id not in (select id from Sample_Table)


--Question 22 :  Write a SQL to find Top 2 records from each department
Create table Emp_Detail
(
EmpName Varchar(25),
Age int,
Salary Bigint,
Department Varchar(20)
);

Insert into Emp_Detail Values('James',25,25000,'Admin');
Insert into Emp_Detail Values('Robert',33,39000,'Admin');
Insert into Emp_Detail Values('Richard',41,48000,'Admin');
Insert into Emp_Detail Values('Thomas',28,30000,'Admin');
Insert into Emp_Detail Values('Tom',40,55000,'Finance');
Insert into Emp_Detail Values('Donald',35,38000,'Finance');
Insert into Emp_Detail Values('Sara',32,44000,'Finance');
Insert into Emp_Detail Values('Mike',28,25000,'HR');
Insert into Emp_Detail Values('John',35,45000,'HR');
Insert into Emp_Detail Values('Mary',23,30000,'HR');
Insert into Emp_Detail Values('David',32,43000,'HR');


with cte as (select empname,salary, dense_rank() Over(partition by department order by salary desc)rk  from Emp_Detail )
select empname,salary from cte where rk <=2


--Question 23 : Write a SQL to display the Source_Phone_Nbr and a flag where the flag needs
--to be set to ‘Y’ if first called number and last called number are the same and ‘N’ if first called number
--and last called number are different

Create Table Phone_Log(
Source_Phone_Nbr Bigint,
Destination_Phone_Nbr Bigint,
Call_Start_DateTime timestamp) ;

Insert into Phone_Log Values (2345,6789,'2012-07-01 10:00');
Insert into Phone_Log Values (2345,1234,'2012-07-01 11:00');
Insert into Phone_Log Values (2345,4567,'2012-07-01 12:00');
Insert into Phone_Log Values (2345,4567,'2012-07-01 13:00');
Insert into Phone_Log Values (2345,6789,'2012-07-01 15:00');
Insert into Phone_Log Values (3311,7890,'2012-07-01 10:00');
Insert into Phone_Log Values (3311,6543,'2012-07-01 12:00');
Insert into Phone_Log Values (3311,1234,'2012-07-01 13:00');


with cte as (
select * ,
row_number() over(partition by Source_Phone_Nbr order by Call_Start_DateTime ) as rk_first,
row_number() over(partition by Source_Phone_Nbr order by Call_Start_DateTime  desc ) as rk_last
from Phone_Log
)

select source_phone_nbr , case when First_Call = last_Call then 'Y' else 'N' end as Flag
from (
select source_phone_nbr,
max(case when rk_first=1 then Destination_Phone_Nbr end) as First_Call ,
max(case when rk_last=1 then Destination_Phone_Nbr end) as last_Call
from cte group by source_phone_nbr)S


select source_phone_nbr , case when first_value = last_value then 'Y' else 'N' end as Flag
from (
select distinct source_phone_nbr,
first_value(Destination_Phone_Nbr) over (partition by source_phone_nbr order by Call_Start_DateTime ),
last_value(Destination_Phone_Nbr) over (partition by source_phone_nbr order by Call_Start_DateTime
rows between unbounded preceding and unbounded following) from Phone_Log) s


-- Question 24 : Write a SQL query to print the Sequence Number from the given range of number.
Create Table SampleTable
(
Start_Range Bigint,
End_Range Bigint
);
Insert into SampleTable Values (1,4);
Insert into SampleTable Values (6,6);
Insert into SampleTable Values (8,9);
Insert into SampleTable Values (11,13);
Insert into SampleTable Values (15,15);

select * from SampleTable

with recursive cte_b as (
select min(Start_Range)  as id from SampleTable -- base sql
union all
select id+1 from cte_b
where id < ( select last_valu from cte_a)
),
 cte_a as (select max(End_Range)as last_valu from SampleTable),

 cte_final as (select cte_b.id, Start_Range , End_Range from cte_b, SampleTable )
 select id from cte_final
 where  id >= Start_Range and id<= End_Range;



--Question 25 : Write a SQL query to get the output as shown in the table

Create Table Sample_1
(
X Bigint,
Y Bigint,
Z Bigint)

Insert into Sample_1 Values (200,400,1);
Insert into Sample_1 Values (200,400,2);
Insert into Sample_1 Values (200,400,3);
Insert into Sample_1 Values (10000,60000,1);
Insert into Sample_1 Values (500,600,1);
Insert into Sample_1 Values (500,600,2);
Insert into Sample_1 Values (20000,80000,1);

select x,y,z from (
select *, count(x) over(partition by x,y)as cnt from Sample_1
) s where cnt >1


--Question 26 : Write a SQL query to get the output as shown in the Output table
Create Table Employee_1(
EmployeeID Varchar(20),
EmployeeName Varchar(20),
ManagerID varchar(20));

Insert Into Employee_1 Values(100,'Mark',103);
Insert Into Employee_1 Values(101,'John',104);
Insert Into Employee_1 Values(102,'Maria',103);
Insert Into Employee_1 Values(103,'Tom',NULL);
Insert Into Employee_1 Values(104, 'David',103);

select * from Employee_1;


select a.EmployeeName as manager, b.EmployeeName  from Employee_1 a inner join Employee_1 b
on a.EmployeeID = b.ManagerID
union
select 'Boss' as manager , EmployeeName from Employee_1 where ManagerID is null

--second method
select
emp.EmployeeName ,
coalesce(mag.EmployeeName , 'BOSS' ) as manager
 from
	Employee_1 emp left join Employee_1 mag
		on emp.ManagerID = mag.EmployeeID


--Question 27: Write a SQL query to get the output as shown in the Output tables

Create Table Sales1
(
Id int,
Product Varchar(20),
Sales Bigint
);

Insert into Sales1 values(1001,'Keyboard',20);
Insert into Sales1 values(1002,'Keyboard',25);
Insert into Sales1 values(1003,'Laptop',30);
Insert into Sales1 values(1004,'Laptop',35);
Insert into Sales1 values(1005,'Laptop',40);
Insert into Sales1 values(1006,'Monitor',45);
Insert into Sales1 values(1007,'WebCam',50);
Insert into Sales1 values(1008,'WebCam',55);


--solution 1
select * , min(sales)over (partition by product order by id ) from sales1

--solution 2
select *, sum(sales)over (partition by product order by id ) from sales1


--Question 28 :

Create Table StudentInfo_1
(
StudentName Varchar(30),
Subjects Varchar(30),
Marks Bigint
);

insert into StudentInfo_1 Values ('David', 'English', 85);
insert into StudentInfo_1 Values ('David', 'Maths', 90);
insert into StudentInfo_1 Values ('David', 'Science', 88);
insert into StudentInfo_1 Values ('John', 'English', 75);
insert into StudentInfo_1 Values ('John', 'Maths', 85);
insert into StudentInfo_1 Values ('John', 'Science', 80);
insert into StudentInfo_1 Values ('Tom', 'English', 83);
insert into StudentInfo_1 Values ('Tom', 'Maths', 80);
insert into StudentInfo_1 Values ('Tom', 'Science', 92);



select * from StudentInfo_1;
--Not able to solve


--question 29 :Write a SQL query to get min and max sal for each department
Create Table Employee_2(
EmpName Varchar(30),
DeptName Varchar(25),
DeptNo Bigint,
Salary Bigint);

Insert into Employee_2 Values('Mark','HR',101,30000);
Insert into Employee_2 Values('John','Accountant',101,20000);
Insert into Employee_2 Values('Smith','Analyst',101,25000);
Insert into Employee_2 Values('Donald','HR',201,40000);
Insert into Employee_2 Values('James','Analyst',201,22000);
Insert into Employee_2 Values('Maria','Analyst',201,38000);
Insert into Employee_2 Values('David','Manager',201,33000);
Insert into Employee_2 Values('Martin','Analyst',301,22000);
Insert into Employee_2 Values('Robert','Analyst',301,56000);
Insert into Employee_2 Values('Michael','Manager',301,34000);
Insert into Employee_2 Values('Robert','Accountant',301,37000);
Insert into Employee_2 Values('Michael','Analyst',301,28000);

--solution 1
with cte as (select * , min(Salary) over(partition by deptno) as min_Salary,
 max(Salary) over(partition by deptno)  as max_Salary
  from Employee_2)

 select * from cte where Salary = min_Salary or Salary=max_Salary

--solution 2

 with cte as (
 select empname , deptname, deptno, salary,
 rank() over(partition by deptno order by salary) as min_salary,
 rank() over(partition by deptno order by salary desc) as max_salary
 from Employee_2
 )

 select empname , deptname, deptno, salary from  cte
 where min_salary=1 or max_salary=1


 --question 30 : Write a SQL query to get the output as shown in the Output tables using the string ‘INTERVIEW’

with recursive cte as (
--Base Query
select 'INTERVIEW' as A , LENGTH('INTERVIEW') as B
union all
--recursive part
select substring(A, 1, B-1), B-1 from cte where B-1 >0
)

 select * from cte

 --quesion 31 :

 /*
  * Problem Statement :- Order Status Table has three columns namely Quote_id, Order_id and Order_Status
When all Orders are in delivered status then Quote status should be ‘Complete’.
When one or more Orders in delivered status then “ In Delivery”.                                                                      When One or  more in Submitted status then “Awaiting for Submission” Else “Awaiting for Entry” by default

Note :- Order Priority should be Delivered, Submitted and Created
 If one order is in delivered and other one is in Submitted then Quote_Status should be “In Delivery”
Similarly if one order is in Submitted and others in Created then the Quote_Status should be “Awaiting for Submission “

**/

 create table OrderStatus
(
Quote_Id varchar(5),
Order_Id varchar(5),
Order_Status Varchar(20)
);

Insert into OrderStatus Values ('A','A1','Delivered') ;
Insert into OrderStatus Values ('A','A2','Delivered') ;
Insert into OrderStatus Values ('A','A3','Delivered') ;
Insert into OrderStatus Values ('B','B1','Submitted') ;
Insert into OrderStatus Values ('B','B2','Delivered') ;
Insert into OrderStatus Values ('B','B3','Created') ;
Insert into OrderStatus Values ('C','C1','Submitted') ;
Insert into OrderStatus Values ('C','C2','Created') ;
Insert into OrderStatus Values ('C','C3','Submitted');
Insert into OrderStatus Values ('D','D1','Created') ;

with cte as (select distinct Quote_Id , Order_Status from OrderStatus),
cte_list as (select Quote_Id, string_agg(Order_Status,',')as list_status from cte group by Quote_Id)

--select Quote_Id ,list_status,  position('Delivered' in list_status ) ,  position(',' in list_status ),position('Submitted' in list_status ) from cte_list

select Quote_Id ,
case when position('Delivered' in list_status )=1 and position(',' in list_status )=0 then 'Complete'
	 when position('Delivered' in list_status )>=1 and position(',' in list_status )>0 then 'In Delivery'
	 when position('Submitted' in list_status )>=1 and position(',' in list_status )>0 and position('Delivered' in list_status )=0 then 'Awaiting for subbmission'
	 else 'Awaiting for Entry' end as Quote_status
	 from cte_list


-- Question 32 SalesInfo Table has three columns namely Continents,
-- Country and Sales. Write a SQL query to get the aggregate sum  of sales  country wise and display
--only those which are maximum in each continents as shown in the table.

Create Table SalesInfo(
Continents varchar(30),
Country varchar(30),
Sales Bigint
);

Insert into SalesInfo Values('Asia','India',50000);
Insert into SalesInfo Values('Asia','India',70000);
Insert into SalesInfo Values('Asia','India',60000);
Insert into SalesInfo Values('Asia','Japan',10000);
Insert into SalesInfo Values('Asia','Japan',20000);
Insert into SalesInfo Values('Asia','Japan',40000);
Insert into SalesInfo Values('Asia','Thailand',20000);
Insert into SalesInfo Values('Asia','Thailand',30000);
Insert into SalesInfo Values('Asia','Thailand',40000);
Insert into SalesInfo Values('Europe','Denmark',40000);
Insert into SalesInfo Values('Europe','Denmark',60000);
Insert into SalesInfo Values('Europe','Denmark',10000);
Insert into SalesInfo Values('Europe','France',60000);
Insert into SalesInfo Values('Europe','France',30000);
Insert into SalesInfo Values('Europe','France',40000);


with cte as (select continents, country , sum(sales) as total_sales from SalesInfo group by 1,2),
 cte_rk as (select  continents, country,total_sales, dense_rank() over (partition by continents order by total_sales desc  )rk from cte )
select continents, country , total_sales from cte_rk where rk =1

--Question 33 :
Create Table Stadium(
id int,
Visit_Date Date,
No_Of_People Bigint);

Insert into Stadium Values(1,'2018-01-01',10);
Insert into Stadium Values(2,'2018-01-02',110);
Insert into Stadium Values(3,'2018-01-03',150);
Insert into Stadium Values(4,'2018-01-04',98);
Insert into Stadium Values(5,'2018-01-05',140);
Insert into Stadium Values(6,'2018-01-06',1450);
Insert into Stadium Values(7,'2018-01-07',199);
Insert into Stadium Values(8,'2018-01-09',125);
Insert into Stadium Values(9,'2018-01-10',88);


with stadium_cte as (
select id as id1, lead(id , 1 ) over(order by id) as id_2,
		  lead(id , 2 ) over(order by id) as id_3 from Stadium
		  where No_Of_People >=100
		  ),
cte_temp as (
	select B.id as id , B.Visit_Date , B.No_Of_People from stadium_cte A
		left join Stadium B
		on (B.id=A.id_2  or B.id = A.id_3)
		where id1 + 1 = id_2 and id_2+1 = id_3
)

select id , Visit_Date, No_Of_People from cte_temp



--question 34 : Write a SQL query to print movie theater like seating numbers as shown in the video.

with recursive cte as (
select chr(ascii('A')) as letter
union all
select chr(ascii(letter)+1) from cte where letter <> 'L'
),
cte_seat as (
	select 1 as number
	union all
	select number + 1 from cte_seat where number <10
),
final_cte as (
select letter , letter || ((number::varchar)) as seat_number  from cte , cte_seat
)
select letter as row ,string_agg(seat_number, ',')  from final_cte
group by letter order by row



--Question 35

Create Table Emp_Table (
SerialNo int,
Name Varchar(30),
Month_ID int,
Amount Bigint );

Insert into Emp_Table Values  (1,'JOHN',1,1000);
Insert into Emp_Table Values  (1,'JOHN',2,3000);
Insert into Emp_Table Values  (8,'DAVID',3,4000);
Insert into Emp_Table Values  (8,'DAVID',5,2000);

Create Table Month_Table(
Month_ID int,
Month Varchar(30));

Insert into Month_Table Values (1, 'JAN');
Insert into Month_Table Values (2, 'FEB');
Insert into Month_Table Values (3, 'MAR');
Insert into Month_Table Values (4, 'APR');
Insert into Month_Table Values (5, 'MAY');
Insert into Month_Table Values (6, 'JUN');
Insert into Month_Table Values (7, 'JUL');
Insert into Month_Table Values (8, 'AUG');
Insert into Month_Table Values (9, 'SEP');
Insert into Month_Table Values (10, 'OCT');
Insert into Month_Table Values (11, 'NOV');
Insert into Month_Table Values (12, 'DEC');




select Month_Table.month_id , month , name , amount  from Month_Table , Emp_Table
on Month_Table.month_id = Emp_Table.month_id


--Question 36

What is the difference between the revenue of each product and the revenue of the best-selling product in the same category of that product?


create table products_revenue 
(
product varchar , category varchar , revenue int)

insert into products_revenue values ('Free5.0','Running',10000 );
insert into products_revenue values ('Free4.0','Running',9000 );
insert into products_revenue values ('LeBron17','Basketball',18000   );
insert into products_revenue values ('Kyrie7','Basketball',	12000  );
insert into products_revenue values ('React','Running',10000 );

insert into products_revenue values ('Air Max1','Basketball',13000)
insert into products_revenue values ('Air Max2','Basketball',12000);
insert into products_revenue values ('Zoom1','Running',9000);
insert into products_revenue values ('Zoom2','Running',8000);


select *,max(revenue)over(partition by category)  ,(max(revenue)over(partition by category)  - revenue) from products_revenue 


