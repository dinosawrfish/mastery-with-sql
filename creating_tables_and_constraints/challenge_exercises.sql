-- 10.11
-- If always, then update/insert values are accepted only for insert if OVERRIDING SYSTEM VALUE.
-- If default, then update/insert then the value can be updated

-- 10.12

create table beach.equipment_types(
	type text primary key
);

create table beach.equipment(
	equipment_id bigserial primary key,
	type text references beach.equipment_types (type)
	description text,
	replacement_cost numeric(7, 2) check(replacement_cost >= 0),
	missing boolean not null default false
);

-- creating a table to store types will allow for inserting/updating more equipment types


-- 10.13
select
	count(*)
from beach.equipment as e
where e.type = 'Single Kayak'
	and e.missing = false
	and e.equipment_id not in
		(select equipment_id
		from beach.rentals
		where return_date is null);

-- 10.14
create table beach.rentals(
	rental_id bigserial primary key,
	customer_id bigint references beach.customer (customer_id) on delete cascade,
	rental_date date,
	return_date date,
);

create table beach.equipments_rented(
	equipment_id bigint references beach.equipments (equipment_id),
	rental_id bigint references beach.rentals (rental_id),
	primary key (equipment_id, rental_id)
);