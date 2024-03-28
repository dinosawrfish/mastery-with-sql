-- 6.1
select r.rental_date, f.title
from film as f
	inner join inventory as inv using (film_id)
	inner join rental as r using (inventory_id)
	inner join customer as c using (customer_id)
where c.first_name || ' ' || c.last_name = 'PETER MENARD'
order by r.rental_date desc;

-- 6.2
select
store.store_id,
staff.first_name || ' ' || staff.last_name as Manager,
staff.email
from store
	inner join staff on store.manager_staff_id = staff.staff_id;

-- 6.3
select
f.film_id,
f.title,
count(*)
from film as f
	inner join inventory as i using (film_id)
	inner join rental as r using (inventory_id)
group by f.film_id, f.title
order by count desc
limit 3;

-- 6.4
select r.customer_id,
count(distinct f.film_id) as num_films,
count(distinct fa.actor_id) as num_actors

from rental as r
	inner join inventory as i using (inventory_id)
	inner join film as f using (film_id)
	inner join film_actor as fa using (film_id)
group by r.customer_id
order by r.customer_id;

-- 6.5
select film.title, language.name as "language"
from film, language
where film.language_id = language.language_id;

select film.title, language.name as "language"
from film
	inner join language on film.language_id = language.language_id;

select film.title, language.name as "language"
from film
	inner join language using (language_id);