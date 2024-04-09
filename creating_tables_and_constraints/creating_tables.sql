-- 10.1
create schema beach;

-- 10.2
create table if not exists beach.customers (
	first_name text,
	last_name text,
	email text,
	phone_number text,
	account_created date
);

-- 10.3
create table if not exists beach.equipment (
	item_type text,
	description text,
	replacement_cost numeric(7, 2) --porecision of 7, scale 2 $99,999.99 max
);

-- 10.4
alter table beach.equipment
	add missing boolean;