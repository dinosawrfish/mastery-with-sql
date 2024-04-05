-- 8.1
select rental_id, customer_id, rental_date
from (
	select
		rental_id,
		customer_id,
		rental_date,
		row_number() over (partition by customer_id order by rental_date desc)
	from rental) as r
where row_number <=3;

-- 8.2
with rent_counts as
(
	select
		film_id,
		count(*),
		rank() over (order by count(*))
	from rental
		inner join inventory using (inventory_id)
	group by film_id
)
select distinct customer_id
from rental as r
	inner join inventory as i using (inventory_id)
where i.film_id in
	(select film_id
	from rent_counts
	where rank = 1);

-- 8.3
with rating_rank as
(
	select
		rating,
		row_number() over (partition by rating)
	from film
	where rating is not null
)
select
	rating
from rating_rank
where row_number = 1;