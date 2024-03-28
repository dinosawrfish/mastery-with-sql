-- 3.8
select 
title,
rating
from film
where rating = 'G';

-- 3.9
select 
title, 
length
from film
where length > 120;

-- 3.10
select 
rental_id,
rental_date
from rental
where rental_date < '2005-06-01';

-- 3.11
select
title,
rental_rate,
replacement_cost,
ceil(replacement_cost / rental_rate) as " # rentals to break-even"
from film
where ceil(replacement_cost / rental_rate) > 30;