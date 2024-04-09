-- 10.9
create table beach.customers(
	customer_id bigint generated always as identity primary key,
	email text unique,
	first_name text not null,
	last_name text not null,
	phone_number text unique,
	create_date date not null default current_date --now() is timestampz current_date is date
	check (email is not null or phone_number is not null)
);

-- 10.10
create table beach.equipment(
	equipment_id bigserial primary key,
	item_type text not null,
	description text,
	replacement_cost numeric(7, 2) check(replacement_cost >= 0),
	missing boolean not null default false
);