-- 9.2
(
	select first_name, last_name
	from customer
)
intersect
(
	select first_name, last_name
	from actor
);

-- 9.3
(
	select film_id
	from film_actor
	where actor_id = 49
)
intersect
(
	select film_id
	from film_actor
	where actor_id = 152
)
intersect
(
	select film_id
	from film_actor
	where actor_id = 180
);