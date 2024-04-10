-- 11.6
begin;

update customer
set email = lower(first_name) || '.' || lower(last_name) ||  '@sakilacustomer.org'
returning *;

rollback;


-- 11.7
begin;

update film
set rental_rate = rental_rate * 1.1
where film id in
	(
	select f.film_id, count(*) as film_count
	from film as f
		inner join inventory using (film_id)
			inner join rental using (inventory_id)
	group by film_id
	order by film_count desc
	limit 20;
	)

rollback;

begin;

update film
set rental_rate = rental_rate * 1.1
where film_id in
  (
    select
      i.film_id
    from rental as r
      inner join inventory as i using (inventory_id)
    group by i.film_id
    order by count(*) desc
    limit 20
  );

rollback;


-- 11.8
begin;

alter table film
	add column length_hrs numeric(2, 1);

update film
set length_hrs = length / 60.0
returning *;

rollback;