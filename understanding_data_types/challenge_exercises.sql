-- 5.9
select count(rental_date) as "total # EOM rentals"
from rental
where date_part('month', rental_date) != date_part('month', rental_date + interval '1 day');

-- 5.10
select title
from film
where left(title, 1) = ' ' or right(title, 1) = ' ';

-- 5.11
select customer_id,
sum(date_part('epoch', return_date - rental_date)/3600)::int as hrs_rented
from rental
group by customer_id
order by hrs_rented desc
limit 3;

-- 5.12
select *
from generate_series(
  timestamptz '2019-01-01 17:00 UTC',
  timestamptz '2019-12-01 17:00 UTC',
  interval '1 month');

-- 5.13
select first_name,
regexp_count(first_name, 'A') as count
from customer
order by count desc;

select
first_name
length(first_name) - length(replace(first_name, 'A', )) as count
from customer
order by count desc;

-- 5.14
select sum(amount) as "total $"
from payment
where extract(dow from payment_date) in (6, 0);
-- where date_part('isodow', payment_date) in (6,7);