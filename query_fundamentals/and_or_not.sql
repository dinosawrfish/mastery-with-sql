-- 3.12
select 
rental_id,
rental_date
from rental
where customer_id = '388' and (rental_date >= '2005-01-01' and rental_date < '2006-01-01');

-- 3.13

select title, rental_duration, length
from film
where not length > 60;

select title, rental_duration, length
from film
where length <= 60;

-- 3.14

select title, rating
from film
where rating != 'G'
  and rating != 'PG';

select title, rating
from film
where rating != 'G'
  or rating != 'PG';

-- The first query will return any films that do not have a rating of G nor PG while the second query will return any films that do not a G rating or a PG rating which will return all films since PG is true for the first or statement and G is true for the second or statement. 
-- The second one is most likely the mistake

-- 3.15

select rental_id, rental_date, return_date
from rental
where return_date > rental_date
	or return_date = rental_date
	or return_date < rental_date;

-- - the number of rows returned does not match the overall values because there may be rentals that were returned. 