-- 4.1
select
count(*) as "# customers",
count(email) as "# customers with email"
from customer;

-- 4.2
select
  count(*) as "# customers",
  count(email) as "# customers with email",
  100.0 * count(email) / count(*) as "% with email"
from customer;

-- 4.3
select count(distinct customer_id)
from payment;

-- 4.4
select
avg(return_date - rental_date) as "avg rental duration"
from rental;

-- 4.5
select
sum(amount) as total
from payment;