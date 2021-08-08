use StackRoute;

create table Customers(Customer_ID int, Name varchar(25));
insert into Customers values(1, 'Michael');
insert into Customers values(2, 'Josh');
insert into Customers values(3, 'Melinda');

select * from Customers;

create table Orders(Order_ID int, Customer_ID int, OrderDate date);
insert into Orders values(100, 1, CURDATE());
insert into Orders values(200, 4, CURDATE());
insert into Orders values(300, 3, CURDATE());

select * from Orders;

/*INNER JOIN: Only the same ID's present in two tables*/
select Customers.customer_ID, Customers.Name, Orders.Order_ID, Orders.OrderDate from 
Customers INNER JOIN Orders ON Customers.Customer_ID=Orders.Customer_ID;

/*LEFT JOIN*/
select Customers.Customer_ID, Name, Order_ID from Customers LEFT JOIN Orders ON 
Customers.Customer_ID=Orders.Customer_ID;

/*RIGHT JOIN*/
select Customers.Customer_ID, Name, Order_ID from Customers RIGHT JOIN Orders ON 
Customers.Customer_ID=Orders.Customer_ID;

/*CROSS JOIN*/
create table shapes(shape_ID int, Shape_Name char(20));
insert into shapes values(1, 'Square');
insert into shapes values(2, 'Circle');
insert into shapes values(3, 'Rectangle');

create table Colors(Color_ID int, Color_Name char(20));
insert into Colors values(11, 'Red');
insert into Colors values(12, 'Blue');
insert into Colors values(13, 'Green');

select Shape_ID, Shape_Name, Color_Name from Shapes CROSS JOIN Colors;

/*SELF JOIN*/
create table emp(empid int, empname varchar(40), mgr_id int);
select * from emp;
drop table emp;
insert into emp values(1, 'Rose', 3);
insert into emp values(2, 'Jay', 3);
insert into emp values(3, 'Selina', 4);
insert into emp values(4, 'Kim', 5);
insert into emp values(5, 'Rany', 6);
insert into emp values(6, 'Rena', null);
insert into emp values(7, 'Vivian', 6);

select e.empname EMP_NAME, m.empname MGR_NAME from emp e left JOIN emp m
ON e.mgr_id=m.empid;


/*SELF JOIN ANOTHER EXAMPLE*/
create table empaddress(city_id int, emp_name varchar(40), emp_city varchar(40));
insert into empaddress values(1, 'Rose', 'California');
insert into empaddress values(2, 'Josh', 'Texas');
insert into empaddress values(3, 'Selina', 'Washington');
insert into empaddress values(4, 'Kim', 'California');
insert into empaddress values(5, 'Rendy', 'Missori');
insert into empaddress values(6, 'Tina', 'New York');
insert into empaddress values(7, 'Vivian', 'California');
select * from empaddress;

select C1.emp_name EMP_NAME, C2.emp_city EMP_CITY from empaddress C1 INNER JOIN
empaddress C2 ON C1.emp_city=C2.emp_city WHERE C2.emp_name='Tina';

/*UNION* Table A & Table B -->> (AUB) /

/*STORED PROCEDURES*/
create table student_info(stud_id int, stud_code int, stud_name varchar(40), subject char(40), marks int, phone char(10));
insert into student_info values(1, 101, 'Mark', 'English', 68, '123659633');
insert into student_info values(2, 102, 'Joseph', 'Science', 70, '545324535');
insert into student_info values(3, 103, 'Helen', 'Maths', 70, '5345345345');
insert into student_info values(4, 104, 'Rose', 'English', 90, '454645646');
insert into student_info values(5, 105, 'Park', 'Science', 85, '456646546');
insert into student_info values(6, 106, 'Linda', 'Biology', 92, '35645645');
insert into student_info values(7, 107, 'Diana', 'Maths', 83, '868545458');
insert into student_info values(8, 108, 'Suzy', 'Chemistry', 85, '965535524');
insert into student_info values(9, 109, 'Maria', 'Biology', 67,'787825454');
insert into student_info values(10, 110, 'Tina', 'Chemistry', 73, '58586454');
select * from student_info;
DELIMITER &&
CREATE procedure get_merit_students()
BEGIN
	SELECT * FROM student_info WHERE marks>70;
    SELECT COUNT(stud_code) AS 'Total Student' FROM student_info WHERE marks>70;
END && 
drop procedure get_merit_students;
call get_merit_students();

DELIMITER &&
CREATE procedure get_students_as_per_numebr(IN count int)
BEGIN
	select * from student_info WHERE stud_id<=count;
END &&
call get_students_as_per_numebr(5);
/*VIEWS*/
create table trainer(course_id int, course_name varchar(40), trainer_name varchar(25));
insert into trainer values(501, 'Java', 'Henry');
insert into trainer values(502, 'Big Data', 'Selina');
insert into trainer values(503, 'Machine Learning', 'William');
insert into trainer values(504, 'Data Science', 'Tina');
insert into trainer values(505, 'Data Analytics', 'Brana');

select * from trainer;
CREATE VIEW trainer_details AS 
SELECT * from trainer;
/*TRIGGERS*/

create table emp_work(empid int, work_hours int, wok_start_date date);
insert into emp_work values(701, -5, CURDATE());
select * from emp_work;
truncate table emp_work;
DELIMITER 
CREATE trigger before_insert_empworkinghours
BEFORE INSERT ON emp_work for each row
BEGIN
	IF NEW.work_hours<0 THEN SET NEW.work_hours=0;
    END IF;
END 











