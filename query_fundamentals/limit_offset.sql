-- 3.27
select payment_id, payment_date
from payment
order by payment_date desc
limit 3;

-- 3.28
select title, length, rating
from film
where rating != 'R'
or rating is null
order by length, title
limit 4;

-- 3.29
select payment_id, amount, payment_date
from payment
where payment_date between '2007-01-01' and '2007-02-01'
order by payment_date desc
limit 3;

-- 3.30
select payment_id, amount, payment_date
from payment
where payment_date between '2007-01-01' and '2007-02-01'
order by payment_date desc, payment_id
limit 3;
-- revisited in future chapter most likely a subquery maybe