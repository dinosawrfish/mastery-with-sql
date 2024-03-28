-- 4.6
select actor_id, count(film_id) as num_films -- due to the nature of the table no need to worry about duplicates so count(*) would have been fine as well
from film_actor
group by actor_id
order by num_films desc;

-- 4.7
select customer_id
from rental
group by customer_id
having count(customer_id) > 40;

-- 4.8
select
date_part('year', payment_date) as year,
date_part('month', payment_date) as month,
staff_id,
count(*) as num_payments,
sum(amount) as payment_total,
avg(amount)as avg_payment_amount
from payment
group by year, month, staff_id
order by year, month, staff_id;
--- need to revist order of execution cause group by should not have known year and month so maybe its a postgresql thing. should have used date_part for group by