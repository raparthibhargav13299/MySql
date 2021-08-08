use sakila;
select * from actor WHERE actor_id=10 AND last_name='GABLE';
/*LIKE Wild cards*/
select last_name from actor WHERE last_name LIKE '%DA%';
/*BETWEEN*/
select address, city_id from address WHERE city_id BETWEEN 1 AND 10;
/*NOT BETWEEN*/
select address, city_id from address WHERE city_id NOT BETWEEN 1 AND 10;
/*IN*/
select * from address WHERE district='Texas' OR district='California' OR district='Alberta'; /*not good way*/
select * from address WHERE district IN('Texas', 'California','Alberta');

/*NOT IN*/
select * from address WHERE district!='Texas' OR district!='California' OR district!='Alberta'; /*not good way*/
select * from address WHERE district NOT IN('Texas', 'California','Alberta');
/*EXISTS*/
select address, district from address WHERE EXISTS(select city_id from address WHERE city_id<=10);
/*DISTINCT=different, unique, not same*/

select DISTINCT district from address;

/*ORDER BY: ASC DESC*/
select * from actor ORDER BY first_name DESC;
/*GROUP BY*/
/*MIN(), MAX(), SUM(), COUNT(), AVG()*/
select COUNT(first_name) AS 'COUNT' from actor;
select * from payment;
select MIN(amount) AS 'Minium Value', MAX(amount) AS 'Maximum Value' from payment;

/*GROUP BY*/
select * from address;
select district, COUNT(*) AS 'No Of People' from address GROUP BY(district);

/*GROUP BY HAVING*/
select customer_id, AVG(amount) AS 'Average of Amount in Each Group'  from payment GROUP BY(customer_id) HAVING AVG(amount)<3;

select * from country;
create table utah(id int, name char(20));
insert into utah values (501,'Apple'), (502, null), (503,'Mango'), (504, null);
select * from utah;
select * from utah WHERE name IS NOT NULL;







