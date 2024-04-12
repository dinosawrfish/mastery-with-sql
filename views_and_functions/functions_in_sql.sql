-- 12.6
create or replace function unreturned_rentals
(
	p_customer_id int
)
returns int
language sql
as $$
	select
		cast(count(*) as int)
	from rentals
	where customer_id = p_customer_id
		and return_date is null;
$$;


-- 12.7
select
	customer_id,
	unreturned_rentals(customer_id)
from customer;


-- 12.8
create or replace function random_int
	(
		p_low_int int,
		p_high_int int
	)
returns int
language sql
as $$
	select
		floor(random() * (p_high_int - p_low_int  + 1) + p_low_int)::int;
$$;