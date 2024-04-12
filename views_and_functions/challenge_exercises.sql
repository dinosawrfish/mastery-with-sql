-- 12.10
create or replace function fizz_buzz(p_n int)
returns table (n int, fb text)
language plpgsql
as $$
	begin
		for counter in 1..p_n loop
			n := counter;
			if (counter % 3 = 0 and counter % 5 = 0) then
				fb := 'FizzBuzz';
			elsif counter % 3 = 0 then
				fb := 'Fizz';
			elsif counter % 5 = 0 then
				fb := 'Buzz';
			else
				fb := n;
			end if;

			return next;
		end loop;
	end
$$;

select *
from fizz_buzz(100);