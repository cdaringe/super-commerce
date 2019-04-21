alter table customers enable row level security;
alter table purchases enable row level security;

create or replace function is_admin() returns bool as $$
	begin
		if current_setting('commerce.is_admin', true) = 'true' then
			return true;
		end if;
		return false;
	end;
$$ language plpgsql stable security definer;

create or replace function get_commerce_user_id() returns int as $$
	declare
		user_id_str varchar;
	begin
		user_id_str := current_setting('commerce.user_id', true);
		if user_id_str is null or user_id_str = '' then
			return 0; -- postgres serial ids start a 1
		end if;
		return user_id_str::int;
	end;
$$ language plpgsql stable security definer;

create policy customers_crud on customers
	using (id = get_commerce_user_id());

create policy purchases_crud
	on purchases
	using (customer_id = get_commerce_user_id() or is_admin())
	with check (is_admin());