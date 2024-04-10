-- 11.1
copy playground.note_tags(note_id, tag)
from '/tmp/mastery_with_sql/ch11-note_tags.csv'
with (format csv, header true);

-- 11.2
copy (
	select u.first_name || ' ' || u.last_name as name,
	count(n.note) as note_count
	from playground.users as u
		inner join playground.notes as n
			on u.email = n.user_email
	group by u.email, u.first_name, u.last_name
	order by note_count desc;
)
to 'temp/mastery_with_sql/ch11-notes-user.csv'
with (format csv, header true);

-- 11.3
copy (
	select
		'test'::text,
		33::int,
		33.3::numeric,
		33.299992::real,
		t::boolean,
		current_date::date,
		current_timestamp::timestamptz,
		'1 day'::interval
)
to '/tmp/mastery_with_sql/ch11-values.txt'
with (format text);