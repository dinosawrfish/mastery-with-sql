-- 7.4
select country
from country
where (select
	  count(city)
	  from city
	  where city.country_id = country.country_id) > 15;

-- 7.5
select
	c.customer_id,
	c.first_name,
	c.last_name,
	(select
	i.store_id
	from inventory as i
	inner join rental as r using (inventory_id)
	where r.customer_id = c.customer_id
	group by i.store_id
	order by count(i.store_id) desc
	limit 1) as "Favourite Store"
from customer as c;

-- 7.6
select
c.first_name,
c.last_name,
case
	when exists
		(select *
		from rental as r
		inner join inventory as i using (inventory_id)
		where r.customer_id = c.customer_id
		and i.store_id != c.store_id) then 'Y'
		else 'N'
end as 'HasRentedOtherStore'
from customer as c;