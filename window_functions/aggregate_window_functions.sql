-- 8.4
select
	customer_id,
	rental_id,
	(return_date - rental_date) as rental_duration,
	avg(rental_duration) over (partition by customer_id)
from rental;

-- 8.5
with monthly_amounts as
(
  select
    date_trunc('month', payment_date) as month,
    sum(amount) as amount
  from payment
  group by month
)
select
  month,
  amount,
  sum(amount) over (order by month) as running_total
from monthly_amounts;