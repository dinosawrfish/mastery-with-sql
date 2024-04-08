-- 9.1
(
	select date_trunc('day', payment_date) as interaction_date
	from payment
)
union
(
	select date_trunc('day', payment_date) as interaction_date
	from rental
)
order by interaction_date;

(
  select cast(rental_date as date) as interaction_date
  from rental
)
union
(
  select cast(payment_date as date) as interaction_date
  from payment
)
order by interaction_date;