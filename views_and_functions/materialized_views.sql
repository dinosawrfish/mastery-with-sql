-- 11.5
create materialized view mvw_rental_film as
  select *
  from vw_rental_film;

(
select * from vw_rental_film
except -- diff if vw has more than mvw
select * from mvw_rental_film
)
union all -- prevent de duplication
(
select * from mvw_rental_film
except -- diff if vm has less than mvw
select * from vw_rental_film
);