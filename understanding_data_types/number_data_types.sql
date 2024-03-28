-- 5.3
select
	round(100.0 * (count(*) filter(where rating = 'NC-17'))/count(*)) as "% NC-17",
	round(100.0 * (count(*) filter(where rating = 'PG'))/count(*)) as "% PG",
	round(100.0 * (count(*) filter(where rating = 'G'))/count(*)) as "% G",
	round(100.0 * (count(*) filter(where rating = 'R'))/count(*)) as "% R",
	round(100.0 * (count(*) filter(where rating = 'PG-13'))/count(*)) as "% PG-13"
from film;

-- 5.4
select int '33'; -- wil convert to int
select int '33.3'; -- errors out, literal must match target type in decorated form
select cast(33.3 as int); -- coerce to int round to nearest int
select cast(33.8 as int); -- coerce to int roudn to nearest int so up
select 33::text; -- to text
select 'hello'::varchar(2); -- returns he
select cast(35000 as smallint); -- errors too big
select 12.1::numeric(1,1); -- errors three digits