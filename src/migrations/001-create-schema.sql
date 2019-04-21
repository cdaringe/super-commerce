create table items (
  id serial unique,
  name varchar
);
create table customers (
  id serial unique,
  first_name varchar
);
create table purchases (
  id serial,
  item_id int  not null references items (id),
  customer_id int  not null references customers (id)
);