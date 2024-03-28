-- 3.31
select distinct rating
from film
where rating is not null
order by rating;

-- 3.32
select distinct date_part('hour', rental_date) as hour
from rental
order by hour;

-- 3.33
select distinct rental_duration, rental_rate
from film
order by rental_duration;

-- 3.34
select first_name
from actor
order by last_name;

select distinct first_name
from actor
order by last_name;

-- since rows have been deduplicated by first_name, ordering by last name is undefined since postgres doesn't know which last name to assign
-- avoid ordering by columns that are not selected to avoid this