-- 11.11
begin;

update customer
set activebool =
	case
		when exists
			(select *
			from rental
			where rental_date >='2006-01-01'
			and rental.customer_id = customer.customer_id)
			then true
		else false
	end
returning *;

rollback;


-- 11.12
begin;

create table inventory_stats(
	store_id smallint references store (store_id),
	film_id smallint references film (film_id),
	stock_count int not null,
	primary key (store_id, film_id)
);

insert into inventory_stats(store_id, film_id, stock_count)
	select s.store_id, f.film_id, count(i.inventory_id)
	from film as f
		cross join store as s
			left join inventory as i
				on f.film_id = i.film_id
				and s.store_id = i.store_id
	group by s.store_id, f.film_id
	on conflict (store_id, film_id)
	DO UPDATE SET
	stock_count = excluded.stock_count
returning *;

rollback;


-- 11.13
begin;

with deleted_rentals as
(
	delete from rental
	where rental_id in
		(select distinct on (customer_id) rental_id
		from rental
		order by customer_id, rental_date
	returning rental_id
)
delete from payment
where rental_id in
	(select rental_id
	from deleted_rentals);

rollback;


-- 11.14
begin;

create table mpaa_ratings(
	rating text primary key
);

insert into mpaa_ratings(rating)
	select unnest(enum_range(null::mpaa_rating));

alter table film
	alter column rating drop default,
	alter column rating type text,
	alter column rating set default 'G',
	add foreign key (rating) references mpaa_ratings(rating);

drop type mpaa_rating;

rollback;