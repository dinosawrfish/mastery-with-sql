-- 6.6
select f.title
from film as f
	left join inventory as i
		on f.film_id = i.film_id
where i.store_id is null;

-- 6.7
select f.title, count(i.inventory_id) as "count"
from film as f
	left join inventory as i
		on f.film_id = i.film_id
group by f.film_id, f.title
order by "count";