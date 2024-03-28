-- 4.11
select
  1.0 * sum(length) / count(*) as avg1,
  1.0 * avg(length) as avg2
from film;

avg1                |avg2                 |
--------------------|---------------------|
114.8850000000000000|115.11523046092184370|

-- in the first avg, all the non null lengths are summed up then divided by the total amount of films in the table including rows with null lengths
-- the second avg only takes the average of  films that are not nulled.
-- The second one seems accurate because the first won't sum nulled values

-- 4.12
select customer_id,
avg(return_date - rental_date) as avg_rent_duration
from rental
group by customer_id
order by avg_rent_duration desc;

-- 4.13
select customer_id,
from payment
group by customer_id
having bool_and(amount > 2);

-- 4.14
select rating, repeat('*', (count(*) / 10)::int) as "count/10"
from film
where rating is not null
group by rating;