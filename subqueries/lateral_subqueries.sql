-- 7.9
-- return the 3 most recent rentals for each customer
select c.first_name, c.last_name d.tile, d.rental_date
from customer as c
	left join lateral(
		select r.customer_id f.title, r.rental_date
		from film as f
			inner join inventory as i
				on film_id
					inner join rental as r
						on inventory_id
		where f.rating = 'PG'
			and c.customer_id = r.customer_id
		order by r.rental_date
		limit 1) as d
	on c.customer_id = d.customer_id;