-- 10.8
create table beach.rentals(
	customer_id bigint references beach.customer (customer_id) on delete cascade,
	equipment_id bigint references beach.equipment (equipment_id) on delete cascade,
	rental_date date,
	return_date date,
	primary key (customer_id, equipment_id, rental_date)
);