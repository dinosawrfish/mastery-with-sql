-- 3.26
select rental_id, date_part('hour', rental_date) as "rental hour"
from rental
where date_part('hour', rental_date) >= 22;