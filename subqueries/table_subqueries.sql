-- 7.7
select c.first_name, c.last_name
from customer as c
	cross join (values (1), (2), (3), (4)) as v(n)
order by c.customer_id;
-- combine each name to new table that has four rows so name will be repeated 4 times

-- 7.8
select
	to_char(rent_day, 'Day') as day_name,
	round(avg(num_rentals)) as average
from
	(select date_trunc('day', rental_date) as rent_day, count(*) as num_rentals
	from rental
	group by rent_day) as T
group by day_name
order by average desc;