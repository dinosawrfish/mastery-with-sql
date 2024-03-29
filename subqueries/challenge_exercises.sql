-- 7.12
select distinct customer_id
from film
where date_part('year', rental_date) = '2005'
and customer_id not in (
select customer_id
from film
where date_part('year', rental_date) = '2006'
);

-- 7.13
select country,
count(*) as num_customers,
round(100.0 * count(*) / (select count(*) from customer)) as percent
from country as cou
inner join city using (country_id)
inner join address using (city_id)
inner join customer using (address_id)
group by country
order by count(customer_id) desc
limit 3;

-- 7.14
with
monthly_amounts as
(
	select
	date_trunc('month', payment_date) as month,
	sum(amount) as total
	from payment
	group by month
)

select curr.month, curr.total, sum(prev.total)
from monthly_amounts as curr
	inner join monthly_amounts as prev
	on curr.month >= prev.month
group by curr.month, curr.total
order by curr.month;

select ma1.month, ma1.total,
(select sum(ma2.total)
from monthly_amounts as ma2
where ma2.month <= ma1.month) as cumamount
from monthly_amounts as ma1
order by ma1.month;

-- 7.15
select s.id
from generate_series(
	(select min(rental_id) from rental), (select max(rental_id) from rental))
	as s(id)
where not exists
	(select *
	from rental as r
	where r.rental_id = s.id);

-- 7.16
with last_3_payments as (
select payment_id, amount, payment_date
from payment
where payment_date between '2007-01-01' and '2007-02-01'
order by payment_date desc
limit 3
)
select *
from last_3_payments
order by payment_date asc;

select payment_id, amount, payment_date
from
  (select payment_id, amount, payment_date
   from payment
   where payment_date >= '2007-01-01'
     and payment_date < '2007-02-01'
   order by payment_date desc
   limit 3) as p
order by payment_date asc;