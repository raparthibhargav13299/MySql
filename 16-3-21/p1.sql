
create database stack;
show databases;
use stack;
create table emp(id int,name varchar(25));
select * from emp;
insert into emp values(101,'john');
alter table emp add sal varchar(20);
alter table emp drop column sal;
insert into emp values(101,'john');
insert into emp values(101,'john');
