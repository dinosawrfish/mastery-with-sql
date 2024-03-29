-- CTEs
-- 7.10
with rental_detail as
(
	select r.customer_id, r.rental_date, f.title
	from rental as r
		inner join inventory as i using (inventory_id)
		inner join film as f using (film_id)
)

select r1.customer_id
from rental detail as r1
	inner join rental_detail as r2
		on r1.customer_id = r2.customer_id
		and r2.rental_date > r1.rental_date
		and r1.title = 'BRIDE INTRIGUE' and r2.title = 'STAR OPERATION';

-- 7.11
with
monthly_amounts as
(
select
	date_trunc('month', payment_date) as month,
	sum(amount) as total
from payment
group by month
) -- note that spacing matters in sql executor
select
	curr.month,
	curr.total as "income",
	prev.total as "prev month income",
	curr.total - prev.total as "change"
from monthly_amounts as curr
	inner join monthly_amounts as prev
		on curr.month = prev.month + interval '1 month';