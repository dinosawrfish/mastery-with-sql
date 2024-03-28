-- 5.1
select title || ' is ' || coalesce(length || ' minutes ', 'uknown length')
from film;

-- 5.2
select left(title, 3) || repeat('*', length(title)-3) as "Guess!"
from film;