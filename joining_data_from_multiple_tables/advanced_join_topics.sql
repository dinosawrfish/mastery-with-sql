-- 6.8

select c.customer_id, count(r.rental_id) as "num_rented"
from customer as c
	left join rental as r
		on c.customer_id = r.customer_id
		and date_trunc('day', r.rental_date) = '20050524'
group by c.customer_id
order by "num_rented" desc and c.customer_id;