-- 7.1
select distinct c.first_name, c.last_name
from customer as c
inner join rental as r using (customer_id)
where date_trunc('day',r.rental_date) = date_trunc('day', (
select rental_date
from rental
order by rental_date
limit 1));

select distinct c.first_name, c.last_name
from rental as r
  inner join customer as c using (customer_id)
where r.rental_date::date =
  (select min(rental_date)::date
   from rental);

-- 7.2
select film_id, title
from film
where film_id not in (
select film_id
from film_actor
);

select f.film_id, f.title
from film as f
left join film_actor using (film_id)
where film_actor.actor_id is null;

-- 7.3
select c.customer_id, c.first_name, c.last_name
from customer as c
inner join rental as r using(customer_id)
inner join inventory as i using (inventory_id)
where i.film_id = (
select i2.film_id
from rental as r2
inner join inventory as i2 using (inventory_id)
group by i2.film_id
order by count(r2.inventory_id), i2.film_id
limit 1
);
