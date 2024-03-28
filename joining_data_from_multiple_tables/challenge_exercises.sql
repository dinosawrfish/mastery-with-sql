-- 6.9
select f.film_id, s.store_id, count(i.inventory_id) as "stock"
from film as f
	cross join store as s
		left join inventory as i using (film_id, store_id)
group by f.film_id, s.store_id
order by stock, f.film_id, s.store_id;

-- 6.10
select * from generate_series('2005-01-01', '2006-01-01', '1 month');

-- 6.11
select r.customer_id
from rental as r
	inner join inventory as i using (inventory_id)
		inner join rental as r2
			on r.customer_id = r2.customer_id
			and r2.rental_date > r.rental_date
		inner join inventory as i2
			on r2.inventory_id = i2.inventory_id
where i.film_id = 92 and i2.film_id = 841;