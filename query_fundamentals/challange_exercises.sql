-- 3.38
select first_name, last_name, email
from customer
order by random()
limit 5;

-- 3.39
select rental_id, rental_date
from rental
where date_part('month', rental_date) = 6 and date_part('year', rental_date) = 2005;

select rental_id, rental_date
from rental
where rental_date between '2005-06-01' and '2005-07-01';

select rental_id, rental_date
from rental
where rental_date >= '2005-06-01' and rental_date < '2005-07-01';

-- 3.40
select title,
rental_rate,
length,
rental_rate / length as per_minute
from film
where length != 0 and length is not null
order by per_minute desc
limit 5;

-- 3.41
select first_name
from customer
where first_name similar to '%A%A%';

-- 3.42
select distinct on (customer_id) customer_id, rental_date
from rental
order by customer_id, rental_date desc;

-- 3.43
select first_name, last_name, email
from customer
where email not like first_name || '.' || last_name || '@sakilacustomer.org';