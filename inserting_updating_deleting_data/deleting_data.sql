-- 11.9
begin;

delete from payment
where amount = 0
returning *;

rollback;

-- 11.10
begin;

delete from language
where language_id not in
	(select distinct language_id
	from film);

rollback;