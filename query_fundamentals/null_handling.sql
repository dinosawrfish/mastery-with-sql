-- 3.16
select rental_id, return_date
from rental
where renturn_date is NULL;

-- 3.17
select title, rating
from film
where rating != 'G'
	and rating != 'PG'
	or rating is NULL; 