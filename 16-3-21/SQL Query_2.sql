use Stackroute;
create table employee_det(empid int, empname varchar(25), emp_desig varchar(40), emp_dep varchar(80), 
emp_salary float);
drop table employee_det;
select * from employee_det;
insert into employee_det(empid, empname, emp_desig) values(101,'Donald','Software Developer');
alter table employee_det ADD emp_city varchar(25);
alter table employee_det DROP column emp_city;
truncate table employee_det;
insert into employee_det values(101,'Donald','Software Developer', 'Information Technology',2500);
insert into employee_det values(102,'Chris','System Analyst', 'System',3500);
insert into employee_det values(103,'Rose','DBA Admin', 'Database Admin',8532);
insert into employee_det values(104,'William','QA Testing', 'Software Testing',9635);

/*DELETE WITH CONDITION*/

delete from employee_det WHERE empid=104;










create table course_det(courseid char(5) primary key, coursename varchar(20));
insert into course_det values('C001','Java');
insert into course_det values('C002','Angular JS');
insert into course_det values('C003','MySQL');
insert into course_det values('C004','CSS');

select * from course_det;

create table student_det(student_id char(5) primary key, first_name char(10), last_name char(10), courseid char(5), foreign key(courseid)
REFERENCES course_det(courseid));
select * from student_det;
insert into student_det values('S01','Mark','Jordan','C001');
insert into student_det values('S02','Josh','Haris','C002');

create table product(product_id int primary key, product_name varchar(25) unique, product_brand varchar(25) unique);

/*COMPOSITE KEY*/
create table product_det(product_name char(10), product_brand char(10), 
product_desc varchar(50), primary key(product_name, product_brand));

insert into product_det values('Lx1','LUX','A Soap with red color');
insert into product_det values('Lx1','Liril','A Soap with red color');
insert into product_det values('Lux Rose','LUX','A Soap with red color');
insert into product_det values('Lux Rose','LUX','A Soap with red color');

create table users(userid int, username varchar(25));
alter table users ADD primary key(userid);
insert into users values(101,'Andy');
select * from users;
alter table student_det ADD foreign key(courseid) references courses(courseid);

alter table users DROP PRIMARY KEY;

select * from continents;
update continents set continent_name='India' WHERE continent_id=7;



























