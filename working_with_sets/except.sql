-- 9.4
(
	select n as id
	from generate_series(1, 16049) as v(n)
)
except
(
	select rental_id as id
	from rental
);

(
  select t.id
  from generate_series(
    (select min(rental_id) from rental),
    (select max(rental_id) from rental)) as t(id)
)
except
(
  select rental_id
  from rental
);


-- 9.5
with rented_customers as (
	select
		c.first_name,
		c.last_name,
		date_part('isodow', r.rental_date) as rental_day
	from customer as c
		inner join rental as r using (customer_id)
)
(
	select first_name, last_name
	from rented_customers
	where rental_day = 6
)
except
(
	select first_name, last_name
	from rented_customers
	where rental_day = 7
)
order by first_name;

(
  select first_name, last_name
  from rental
    inner join customer using (customer_id)
  where date_part('isodow', rental_date) = 6
)
except
(
  select first_name, last_name
  from rental
    inner join customer using (customer_id)
  where date_part('isodow', rental_date) = 7
)
order by first_name;