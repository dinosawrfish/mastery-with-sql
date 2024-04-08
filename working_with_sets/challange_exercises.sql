-- 9.6
(
  select cast(rental_date as date) as interaction_date, 'rental' as type
  from rental
)
union
(
  select cast(payment_date as date) as interaction_date, 'payment' as type
  from payment
)
order by interaction_date;

-- 9.7
with customer_locations as (
	select country
	from customer
		inner join address using (address_id)
			inner join city using (city_id)
				inner join country using (country_id)
),
staff_locations as (
	select country
	from staff
	inner join address using (address_id)
		inner join city using (city_id)
			inner join country using (country_id)
)
(
	select country
	from customer_locations
)
intersect
(
	select country
	from staff_locations
);

with address_country as
(
	select country, address_id
	from address
		inner join city using (city_id)
			inner join country using (country_id)
)
(
	select country
	from staff
		inner join address_country using (address_id)
)
intersect
(
	select country
	from customer
		inner join address_country using (address_id)
);

-- 9.8
-- We can either get the set query of the union and except from the set query of the intersection.
-- or do a set query of A's except then add B's except.