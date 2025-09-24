/*
  Seed: Kreations Cafe beverages and food (categories, items, sizes, add-ons, images)

  Assumptions (matches existing app/hooks):
  - categories(id text PK, name text, icon text, sort_order int, active bool)
  - menu_items(id uuid PK default gen_random_uuid(), name text, description text, base_price decimal, category text FK->categories.id, popular bool, available bool, image_url text, discount_* fields present)
  - variations(id uuid PK default gen_random_uuid(), menu_item_id uuid FK->menu_items.id, name text, price decimal)
  - add_ons(id uuid PK default gen_random_uuid(), menu_item_id uuid FK->menu_items.id, name text, price decimal, category text)

  Notes:
  - Where prices "vary", we create size variations and set base_price to the Small price (or 0 when only variations apply). 
  - Image URLs use royalty-free placeholders; replace with your actual images.
*/

BEGIN;

-- Ensure a unique index exists on menu_items(name) for ON CONFLICT clauses
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes 
    WHERE schemaname = 'public' AND indexname = 'uniq_menu_items_name'
  ) THEN
    CREATE UNIQUE INDEX uniq_menu_items_name ON menu_items(name);
  END IF;
END $$;

-- Ensure categories exist (id, name, icon, sort_order, active)
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('espresso', 'Espresso', '☕', 1, true),
  ('matcha', 'Matcha', '🍵', 2, true),
  ('blended', 'Blended', '🧊', 3, true),
  ('sparkler', 'Sparkler', '🍹', 4, true),
  ('hot-drink', 'Hot Drink', '🔥', 5, true),
  ('cold-drink', 'Cold Drink', '🥤', 6, true),
  ('dessert-drink', 'Dessert Drink', '🍨', 7, true),
  ('soda', 'Soda', '🥤', 8, true),
  ('float', 'Float', '🍦', 9, true),
  ('rice-meal', 'Rice Meal', '🍚', 10, true),
  ('sandwich', 'Sandwich', '🥪', 11, true),
  ('pasta', 'Pasta', '🍝', 12, true),
  ('pulutan', 'Pulutan', '🍗', 13, true),
  ('side', 'Side', '🍟', 14, true),
  ('extra', 'Extra', '➕', 15, true),
  ('signature-meal', 'Signature Meal', '🌟', 16, true),
  ('signature-side', 'Signature Side', '⭐', 17, true)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, active = true;

-- Helper CTE to insert a menu item and return id
-- Usage example shown below per item

-- =============== Espresso-Based Drinks ===============
WITH americano_plain AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Americano (Plain)', 'Classic espresso diluted with hot water', 65, 'espresso', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), americano_orange AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Americano (Orange)', 'Americano with a hint of orange', 70, 'espresso', false, true, 'https://images.pexels.com/photos/1122052/pexels-photo-1122052.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), americano_latte AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Americano (Latte)', 'Creamy americano latte', 75, 'espresso', false, true, 'https://images.pexels.com/photos/324028/pexels-photo-324028.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), cappuccino_plain AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Cappuccino (Plain)', 'Espresso with steamed milk and foam', 75, 'espresso', false, true, 'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), cappuccino_flavored AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Cappuccino (Flavored)', 'Cappuccino with flavored syrup', 80, 'espresso', false, true, 'https://images.pexels.com/photos/3407776/pexels-photo-3407776.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), spanish_latte_plain AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Spanish Latte (Plain)', 'Rich latte with Spanish-style sweetness', 80, 'espresso', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), spanish_latte_flavored AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Spanish Latte (Flavored)', 'Spanish latte with flavored syrup', 85, 'espresso', false, true, 'https://images.pexels.com/photos/261532/pexels-photo-261532.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
), mocha_flavored AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Mocha (Flavored)', 'Chocolate flavored caffe mocha', 85, 'espresso', false, true, 'https://images.pexels.com/photos/884468/pexels-photo-884468.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='espresso'
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, v.name, v.price FROM (
  SELECT (SELECT id FROM americano_plain) AS id, 'Small' AS name, 65::decimal AS price UNION ALL
  SELECT (SELECT id FROM americano_plain), 'Medium', 75 UNION ALL
  SELECT (SELECT id FROM americano_plain), 'Large', 85 UNION ALL

  SELECT (SELECT id FROM americano_orange), 'Small', 70 UNION ALL
  SELECT (SELECT id FROM americano_orange), 'Medium', 80 UNION ALL
  SELECT (SELECT id FROM americano_orange), 'Large', 90 UNION ALL

  SELECT (SELECT id FROM americano_latte), 'Small', 75 UNION ALL
  SELECT (SELECT id FROM americano_latte), 'Medium', 85 UNION ALL
  SELECT (SELECT id FROM americano_latte), 'Large', 95 UNION ALL

  SELECT (SELECT id FROM cappuccino_plain), 'Small', 75 UNION ALL
  SELECT (SELECT id FROM cappuccino_plain), 'Medium', 85 UNION ALL
  SELECT (SELECT id FROM cappuccino_plain), 'Large', 95 UNION ALL

  SELECT (SELECT id FROM cappuccino_flavored), 'Small', 80 UNION ALL
  SELECT (SELECT id FROM cappuccino_flavored), 'Medium', 90 UNION ALL
  SELECT (SELECT id FROM cappuccino_flavored), 'Large', 100 UNION ALL

  SELECT (SELECT id FROM spanish_latte_plain), 'Small', 80 UNION ALL
  SELECT (SELECT id FROM spanish_latte_plain), 'Medium', 90 UNION ALL
  SELECT (SELECT id FROM spanish_latte_plain), 'Large', 100 UNION ALL

  SELECT (SELECT id FROM spanish_latte_flavored), 'Small', 85 UNION ALL
  SELECT (SELECT id FROM spanish_latte_flavored), 'Medium', 95 UNION ALL
  SELECT (SELECT id FROM spanish_latte_flavored), 'Large', 105 UNION ALL

  SELECT (SELECT id FROM mocha_flavored), 'Small', 85 UNION ALL
  SELECT (SELECT id FROM mocha_flavored), 'Medium', 95 UNION ALL
  SELECT (SELECT id FROM mocha_flavored), 'Large', 105
) v;

-- =============== Matcha Series (sizes vary) ===============
WITH matcha_latte AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Matcha Latte', 'Creamy Japanese matcha latte', 0, 'matcha', false, true, 'https://images.pexels.com/photos/1442492/pexels-photo-1442492.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='matcha'
  RETURNING id
), ichigo_matcha AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Ichigo Matcha', 'Strawberry matcha fusion', 0, 'matcha', false, true, 'https://images.pexels.com/photos/1442492/pexels-photo-1442492.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='matcha'
  RETURNING id
), dirty_matcha AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Dirty Matcha', 'Matcha with espresso shot', 0, 'matcha', false, true, 'https://images.pexels.com/photos/1442492/pexels-photo-1442492.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='matcha'
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT s.id, s.name, s.price FROM (
  -- Provide example tier; adjust later if needed
  SELECT (SELECT id FROM matcha_latte) AS id, 'Small' AS name, 95::decimal AS price UNION ALL
  SELECT (SELECT id FROM matcha_latte), 'Medium', 110 UNION ALL
  SELECT (SELECT id FROM matcha_latte), 'Large', 130 UNION ALL

  SELECT (SELECT id FROM ichigo_matcha), 'Small', 105 UNION ALL
  SELECT (SELECT id FROM ichigo_matcha), 'Medium', 120 UNION ALL
  SELECT (SELECT id FROM ichigo_matcha), 'Large', 140 UNION ALL

  SELECT (SELECT id FROM dirty_matcha), 'Small', 110 UNION ALL
  SELECT (SELECT id FROM dirty_matcha), 'Medium', 125 UNION ALL
  SELECT (SELECT id FROM dirty_matcha), 'Large', 145
) s;

-- =============== Blended Drinks ===============
WITH blended_all AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Blended Drink (Any Flavor)', 'Choose from caramel, white mocha, strawberry, java chip, snickers, etc.', 85, 'blended', false, true, 'https://images.pexels.com/photos/434295/pexels-photo-434295.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='blended'
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT (SELECT id FROM blended_all), v.name, v.price
FROM (VALUES ('Small', 85::decimal), ('Medium', 100::decimal), ('Large', 140::decimal)) v(name, price);

-- =============== Sparklers & Other Beverages ===============
WITH sparkler AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Sparkler Sodas', 'Fizzy fruit-flavored sodas', 0, 'sparkler', false, true, 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='sparkler'
  RETURNING id
), hot_choco AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Hot Chocolate', 'Rich hot cocoa', 65, 'hot-drink', false, true, 'https://images.pexels.com/photos/3026803/pexels-photo-3026803.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='hot-drink'
  RETURNING id
), iced_tea AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Iced Tea', 'House-brewed iced tea', 35, 'cold-drink', false, true, 'https://images.pexels.com/photos/533358/pexels-photo-533358.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='cold-drink'
  RETURNING id
), affogato AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Affogato', 'Espresso over ice cream', 0, 'dessert-drink', false, true, 'https://images.pexels.com/photos/3026803/pexels-photo-3026803.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='dessert-drink'
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT z.id, z.name, z.price FROM (
  SELECT (SELECT id FROM hot_choco) AS id, 'Small' AS name, 65::decimal AS price UNION ALL
  SELECT (SELECT id FROM hot_choco), 'Large', 85 UNION ALL

  SELECT (SELECT id FROM iced_tea), 'Small', 35 UNION ALL
  SELECT (SELECT id FROM iced_tea), 'Large', 55 UNION ALL
  SELECT (SELECT id FROM iced_tea), 'Pitcher', 120
) z;

-- =============== Soft Drinks & Floats ===============
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
VALUES
  ('Soda (Coke/Pepsi/Sprite)', 'Assorted sodas', 0, 'soda', false, true, 'https://images.pexels.com/photos/248707/pexels-photo-248707.jpeg?auto=compress&cs=tinysrgb&w=800')
ON CONFLICT (name) DO NOTHING;

WITH floats AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
  VALUES ('Floats (Brown/Black/Orange Creamsicle)', 'Ice cream floats', 85, 'float', false, true, 'https://images.pexels.com/photos/434295/pexels-photo-434295.jpeg?auto=compress&cs=tinysrgb&w=800')
  ON CONFLICT (name) DO UPDATE SET category='float'
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT (SELECT id FROM floats), 'Regular', 85::decimal;

-- =============== Rice Meals ===============
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
VALUES
  ('Tonkatsu', 'Crispy breaded pork cutlet with sauce', 130, 'rice-meal', false, true, 'https://images.pexels.com/photos/2518893/pexels-photo-2518893.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Tocilog', 'Tocino, fried rice, and egg', 130, 'rice-meal', false, true, 'https://images.pexels.com/photos/2862154/pexels-photo-2862154.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Tori Rice Meal', 'Japanese-style chicken rice bowl', 249, 'rice-meal', false, true, 'https://images.pexels.com/photos/2862154/pexels-photo-2862154.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Garlic Parmesan Chicken', 'Savory chicken with garlic parmesan sauce', 130, 'rice-meal', false, true, 'https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('HeSarap Chicken Bites', 'Crispy chicken bites', 130, 'rice-meal', false, true, 'https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=800')
ON CONFLICT (name) DO NOTHING;

-- =============== Sandwiches ===============
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
VALUES
  ('Grilled Cheese Panini', 'Melted cheese in toasted panini', 75, 'sandwich', false, true, 'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Sunburnt Peanut Butter', 'Peanut butter sandwich', 55, 'sandwich', false, true, 'https://images.pexels.com/photos/299929/pexels-photo-299929.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ham & Cheese Panini', 'Ham and cheese panini', 85, 'sandwich', false, true, 'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chicken Panini', 'Chicken panini', 95, 'sandwich', false, true, 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Egg & Cheese Panini', 'Egg and cheese panini', 65, 'sandwich', false, true, 'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ham, Egg & Cheese Panini', 'Ham, egg and cheese panini', 90, 'sandwich', false, true, 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=800')
ON CONFLICT (name) DO NOTHING;

-- Sandwich add-ons (grilled onions, fries, iced tea)
INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, ao.name, ao.price, ao.category
FROM (
  SELECT 'Grilled Onions' AS name, 30::decimal AS price, 'extras' AS category UNION ALL
  SELECT 'Fries', 20, 'extras' UNION ALL
  SELECT 'Iced Tea', 20, 'extras'
) ao
JOIN menu_items mi ON mi.category = 'sandwich' AND mi.name IN (
  'Grilled Cheese Panini','Sunburnt Peanut Butter','Ham & Cheese Panini','Chicken Panini','Egg & Cheese Panini','Ham, Egg & Cheese Panini'
);

-- =============== Pasta, Pulutan & Sides ===============
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
VALUES
  ('Carbonara', 'Creamy white sauce pasta', 120, 'pasta', false, true, 'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Spaghetti', 'Classic red sauce pasta', 120, 'pasta', false, true, 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Loaded Nachos', 'Loaded nachos with toppings', 120, 'pulutan', false, true, 'https://images.pexels.com/photos/4194591/pexels-photo-4194591.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('French Fries', 'Crispy fries', 75, 'side', false, true, 'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Onion Rings (Double Trouble)', 'Crispy onion rings', 120, 'side', false, true, 'https://images.pexels.com/photos/3655916/pexels-photo-3655916.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Nachos', 'Corn nachos', 90, 'side', false, true, 'https://images.pexels.com/photos/4194591/pexels-photo-4194591.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Tacos', 'Tasty tacos', 90, 'side', false, true, 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mini Quesadilla', 'Cheesy mini quesadilla', 90, 'side', false, true, 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=800')
ON CONFLICT (name) DO NOTHING;

-- Extras
INSERT INTO menu_items (name, description, base_price, category, popular, available)
VALUES
  ('Rice (Solo/With Side)', 'Steamed rice options', 25, 'extra', false, true),
  ('Fried Egg', 'Sunny-side up egg', 15, 'extra', false, true),
  ('Fried Garlic / Onions', 'Crispy fried garlic or onions', 10, 'extra', false, true)
ON CONFLICT (name) DO NOTHING;

-- Rice (Solo/With Side) variations
WITH rice_item AS (
  SELECT id FROM menu_items WHERE name = 'Rice (Solo/With Side)' LIMIT 1
)
INSERT INTO variations (menu_item_id, name, price)
SELECT r.id, r.name, r.price FROM (
  SELECT (SELECT id FROM rice_item), 'Solo' AS name, 25::decimal AS price UNION ALL
  SELECT (SELECT id FROM rice_item), 'With Side', 50::decimal
) r;

-- =============== Signature Items ===============
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url)
VALUES
  ('Signature Sandwich (w/ iced tea)', 'Signature sandwich combo with iced tea', 180, 'signature-meal', true, true, 'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Signature Sandwich (Solo)', 'Signature sandwich only', 75, 'signature-meal', false, true, 'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cauli Crunch w/ Honey (w/ rice)', 'Cauliflower crunch with honey and rice', 250, 'signature-meal', false, true, 'https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cauli Crunch (Solo)', 'Cauliflower crunch only', 120, 'signature-meal', false, true, 'https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Crispy Cheesy Fries', 'Crispy fries with cheese', 180, 'signature-side', false, true, 'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Signature Fries (w/ toppings)', 'Special fries with toppings', 250, 'signature-side', false, true, 'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800')
ON CONFLICT (name) DO NOTHING;

-- =============== Beverage Add-ons ===============
-- Oreo, Snickers, Espresso Shot, Whipped Cream (₱20–₱30)
INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, a.name, a.price, 'extras'
FROM (
  SELECT 'Oreo' AS name, 20::decimal AS price UNION ALL
  SELECT 'Snickers', 30 UNION ALL
  SELECT 'Espresso Shot', 30 UNION ALL
  SELECT 'Whipped Cream', 20
) a
JOIN menu_items mi ON mi.category IN ('espresso','matcha','blended','sparkler','hot-drink','cold-drink');

COMMIT;


