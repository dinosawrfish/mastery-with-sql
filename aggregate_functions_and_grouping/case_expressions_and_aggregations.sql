-- 4.9
select sum(case when return_date - rental_date < interval '3 days' then 1 else 0 end) as "lt 3 days",
sum(case when return_date - rental_date >= interval '3 days' then 1 else 0 end) as "gt 3 days",
sum(case when return_date is null then 1 else 0 end) as "never returned"
from rental;

-- 4.10
select
	case
		when length < 60 then '0-1hrs'
		when length between 60 and 119 then '1-2hrs'
		when length between 120 and 179 then '2-3hrs'
		else '3hrs+'
	end as len,
count(*)
from film
group by 1 -- use numerical position to avoid rewriting CASE expression
order by 1;