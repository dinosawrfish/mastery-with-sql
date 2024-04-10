-- 11.4
begin;

insert into customer(store_id, first_name, last_name, address_id, activebool, create_date)
	values
		(1, 'John', 'Henry', 1, true, current_date)
	returning *;

rollback;

-- 11.5
begin;

create table rental_stats(
	date date,
	num_rentals int
);

insert into rental_stats(date, num_rentals)
	select
		rental_date::date as rental_day,
		count(*)
	from rental
	group by rental_day
	order by rental_day;

rollback;

begin;

create table rental_stats as
	select
		rental_date::date as rental_day,
		count(*)
	from rental
	group by rental_date
	ordery by rental_date;

rollback;