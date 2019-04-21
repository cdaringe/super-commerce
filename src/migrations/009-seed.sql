insert into items (name) values
  ('nintendo64'),
  ('pizza'),
  ('cacao-nibs'),
  ('fancy-water');

insert into customers (first_name) values
  ('c-bear'),
  ('jamal'),
  ('jessica'),
  ('chaz');

insert into purchases (customer_id, item_id) values
  (1, 4),
  (1, 2), -- now that's a meal, c-bear!
  (2, 1), -- mario 64, great game. enjoy, jamal!
  (3, 3), -- tasty nibs
  (4, 3); -- tasty nibs