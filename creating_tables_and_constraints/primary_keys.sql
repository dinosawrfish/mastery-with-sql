-- 10.5
drop table beach.customers;

create table beach.customers(
	customer_id bigint generated always as identity primary key,
	email text,
	first_name text,
	last_name text,
	phone_number text,
	create_date date
);

-- 10.6
drop table beach.equipment;

create table beach.equipment(
	equipment_id bigserial primary key,
	item_type text,
	description text,
	replacement_cost numeric(7, 2),
	missing boolean
);

-- 10.7
create table beach.rentals(
	customer_id bigint,
	equipment_id bigint,
	rental_date date,
	return_date date,
	primary key (customer_id, equipment_id, rental_date)
);