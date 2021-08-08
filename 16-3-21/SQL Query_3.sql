use sakila;
select * from actor;
/*AND , OR*/
select * from language;
select * from language WHERE name='English' OR name='Italian';
/*LIKE*/
select * from actor where last_name like '%SON';
/*BETWEEN*/
select * from address;
select  district, city_id from address WHERE city_id  BETWEEN 15 AND 175 ;
/*IN*/
select * from address WHERE district IN('Texas','California','Masqat');
/*EXIST*/
select address  from address WHERE EXISTS(Select city_id from address where city_id<=10);
/*NOT EQUAL*/
select * from film;
select title, special_features from film WHERE special_features!='Trailers' AND special_features!='Deleted Scenes' ;


/*ORDER BY*/
select * from actor ORDER BY first_name desc;

/*GROUP BY*/
select district, COUNT(*) AS 'Number_of_People' from address GROUP BY district;

/*HAVING*/
SELECT * FROM PAYMENT;
select customer_id, avg(amount) AS 'Average anount paid' from payment GROUP BY customer_id  HAVING customer_id<=10 ;

