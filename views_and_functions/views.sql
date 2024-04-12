-- 12.1
create view vw_rental_film as
	select
		r.rental_id,
		f.title,
		f.length,
		f.rating
	from rental as r
		inner join inventory as i using (inventory_id)
			inner join film as f using (film_id)
	order by r.rental_id;

select *
from vw_rental_film;


-- 12.2
select
	c.customer_id,
	count(r.rental_id)
from rental as r
	inner join vw_rental_film as vrf
	on vrf.rental_id = r.rental_id
	and vrf.rating = 'R'
		right join customer as c using (customer_id)
group by c.customer_id
order by c.customer_id;

select
  c.customer_id,
  count(r.rental_id)
from customer as c
  left join (rental as r
               inner join vw_rental_film as rf
                 on r.rental_id = rf.rental_id
                 and rf.rating = 'R')
    using (customer_id)
group by c.customer_id
order by c.customer_id;


-- 12.3
create view vw_monthly_totals
	select
		date_trunc('month', payment_date) as month,
		sum(amount) as total
	from payment
	group by month
	order by month;


-- 12.4
select
	month,
	total as income,
	lag(total) over (order by month) as "prev month income",
	total - lag(total) over (order by month) as "change"
from vw_monthly_totals
order by month;