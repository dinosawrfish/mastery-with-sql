-- 3.22
select first_name, last_name
from customer
where email is not null
order by last_name desc;

-- 3.23
select country_id, city
from city
order by country_id, city desc;

-- 3.24
select
first_name || ' ' || last_name as "full_name",
length(first_name || ' ' || last_name) as len
from actor
order by len desc;
--  no guaranteed order of evaluation of expressions in the SELECT clause and other clauses in general

-- 3.25
-- the first query orders x first by asc then y by desc
-- the second query orders x first by desc and then y by desc