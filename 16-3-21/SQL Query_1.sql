create database Stack1;
use Stack1;
/*The PRIMARY KEY constraint uniquely identifies each record in a table.*/
/*COURSE_DETAILS*/
create table course_details(courseid int primary key, coursename varchar(50));


/*STUDENTS_DETAILS*/
create table Student_details(studentid int primary key not null, first_name varchar(10), last_name varchar(10),
courseid int, foreign key(courseid) REFERENCES course_details(courseid));

insert into course_details values(101,'Data Science');
insert into course_details values(102,'Artificial intelligence');
insert into course_details values(103,'Big Data');
insert into course_details values(104,'Machine Learning');
drop table course_details;
select * from course_details;

insert into student_details values(2,'Rose', 'Lucas', 108);
select * from student_details;

/*Adding unique key after the table creation*/
alter table course_details add unique(courseid);

create temporary table temp_table  select * from course_details LIMIT 0;
select * from temp_table;
use Stackroute;
alter table newemployee drop column empid;

insert into doss select * from contact_details;


select * into gog from contact_details;



