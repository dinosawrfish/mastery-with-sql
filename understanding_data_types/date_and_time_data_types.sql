-- 5.5
select *
from pg_timezone_names;

select *
from pg_timezone_abbrevs;

select timestamptz '2019-03-04 15:30:00 EST';
select timestamptz '2019-03-04 15:30:00 -5';
select timestamptz '2019-03-04 15:30:00 America/New_York';

-- 5.6
select
title,
cast(rental_duration || ' days' as interval) as duration,
cast(rental_duration + 1 || ' days' as interval) as duration
from film;

-- 5.7
select date_part('hour', rental_date) as hour,
count(*)
from rental
group by hour
order by hour;

-- 5.8
select
  date_part('year', payment_date) as "year",
  date_part('month', payment_date) as "month",
  sum(amount) as total
from payment
group by "year", "month"
order by "year", "month";

select date_trunc('month', payment_date) as "month",
sum(amount) as total
from payment
group by "month"
order by "month";