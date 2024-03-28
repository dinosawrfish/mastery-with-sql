-- 3.5
select 
first_name,
length(first_name) as "length"
from customer;

-- 3.6
select
first_name,
last_name,
substring(first_name for 1) || substring(last_name for 1) as initial --can also use left(string, 1)
from customer;

-- 3.7
select
title,
rental_rate,
replacement_cost,
ceil(replacement_cost / rental_rate) as " # rentals to break-even"
from film;