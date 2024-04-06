-- 8.6
with film_earnings as (
select
	f.film_id,
	f.title,
	f.rating,
	count(*) * f.rental_rate as "income",
	rank () over (partition by f.rating
						order by count(*) * f.rental_rate desc)
from rental as r
	inner join inventory as i using (inventory_id)
		inner join film as f using (film_id)
where rating is not null
group by f.film_id
)
select
	title,
	rating,
	income
from film_earnings
where rank <= 3;

with film_incomes as
(
  select
    f.film_id,
    f.title,
    f.rating,
    f.rental_rate * count(*) as income
  from rental as r
    inner join inventory as i using (inventory_id)
    inner join film as f using (film_id)
  group by f.film_id
),
film_rankings as
(
  select
    film_id,
    title,
    rating,
    income,
    rank() over(partition by rating order by income desc)
  from film_incomes
  where rating is not null
)
select title, rating, income
from film_rankings
where rank <= 3
order by rating, rank;

--8.7
select
	current + 1 as missing_from,
	next - 1 as missing_to
from (
	select
		rental_id as current,
		lead(rental_id, 1) over (order by rental_id) as next
	from rental) as t
where next - current > 1;

--8.8
with breaks as
(
	select
		customer_id,
		rental_date,
		lead(rental_date) over (partition by customer_id order by rental_date) - rental_date as diff
	from rental
)
select
	customer_id,
	max(diff) as "longest_break"
from breaks
group by customer_id
order by customer_id