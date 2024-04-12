-- 12.9
create or replace function customer_dscount(p_customer_id int, p_film_id int)
returns boolean
language plpgsql
as $$
	declare
		num_outstanding int;
		num_rented int;
	begin
		num_outstanding = unreturned_rentals(p_customer_id);

		select count(*) into num_rented
		from rental as r
			inner join inventory as i using (inventory_id)
				inner join film as f using (film_id)
		where customer_id = p_customer_id
			and film_id = p_film_id;

		return (num_outstanding = 0 and num_rented = 0);
	end
$$;