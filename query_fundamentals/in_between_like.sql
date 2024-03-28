-- 3.18
select title, rating
from film
where rating in ('PG', 'G', 'PG-13');

-- 3.19
select title, length
from film
where length >= 90
  and length <= 120;

select title, length
from film
where length between 90 and 120;

-- 3.20
select title
from film
where title like '%GRAFFITI';

-- 3.21
select title, rating
from film
where rating not in ('G', 'PG'); --  null ratings are not in the list