/*
  # Kreations Cafe Menu Data - Fixed Version
  Complete menu items with variations, add-ons, and images for coffee shop
*/

-- Insert Categories
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('espresso', 'Espresso Drinks', '☕', 1, true),
  ('matcha', 'Matcha Series', '🍵', 2, true),
  ('blended', 'Blended Drinks', '🧊', 3, true),
  ('sparkler', 'Sparklers', '🍹', 4, true),
  ('hot-drink', 'Hot Drinks', '☕', 5, true),
  ('cold-drink', 'Cold Drinks', '🥤', 6, true),
  ('soda', 'Soft Drinks', '🥤', 7, true),
  ('float', 'Floats', '🍦', 8, true),
  ('rice-meal', 'Rice Meals', '🍚', 9, true),
  ('sandwich', 'Sandwiches', '🥪', 10, true),
  ('pasta', 'Pasta', '🍝', 11, true),
  ('pulutan', 'Pulutan', '🍿', 12, true),
  ('side', 'Sides', '🍟', 13, true),
  ('signature', 'Signature Items', '🌟', 14, true),
  ('extra', 'Extras', '➕', 15, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  icon = EXCLUDED.icon,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

-- Insert Menu Items

-- ESPRESSO-BASED DRINKS
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Americano (Plain)', 'Rich espresso with hot water for a clean, bold taste', 65, 'espresso', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Americano (Orange)', 'Espresso with orange zest for a citrusy twist', 70, 'espresso', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Americano (Latte)', 'Espresso with steamed milk for a creamy finish', 75, 'espresso', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Cappuccino (Plain)', 'Classic espresso with steamed milk and foam', 75, 'espresso', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Cappuccino (Flavored)', 'Espresso with flavored steamed milk and foam', 80, 'espresso', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Spanish Latte (Plain)', 'Rich espresso with condensed milk for sweetness', 80, 'espresso', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Spanish Latte (Flavored)', 'Espresso with condensed milk and flavoring', 85, 'espresso', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Mocha (Flavored)', 'Espresso with chocolate and steamed milk', 85, 'espresso', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- MATCHA SERIES
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Matcha Latte', 'Authentic Japanese matcha with steamed milk', 75, 'matcha', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Ichigo Matcha', 'Matcha latte with fresh strawberry flavors', 80, 'matcha', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Dirty Matcha', 'Matcha latte with a shot of espresso', 85, 'matcha', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- BLENDED DRINKS
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('All Blended Flavors', 'Choose from: Caramel Highrise, Blu Cura White Mocha, Creamy Strawberry, Java Chip Mocha, Snickers Mocha', 85, 'blended', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- SPARKLERS & OTHER BEVERAGES
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Sparkler Sodas', 'Refreshing sparkling beverages with various flavors', 45, 'sparkler', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Hot Chocolate', 'Rich and creamy hot chocolate drink', 65, 'hot-drink', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Iced Tea', 'Refreshing iced tea beverage', 35, 'cold-drink', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Affogato', 'Espresso poured over vanilla ice cream', 95, 'hot-drink', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- SOFT DRINKS & FLOATS
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Soft Drinks', 'Coke, Pepsi, Sprite - Classic carbonated beverages', 25, 'soda', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Floats', 'Ice cream floats: Brown, Black, or Orange Creamsicle', 85, 'float', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- RICE MEALS
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Tonkatsu', 'Breaded and fried pork cutlet with rice and vegetables', 130, 'rice-meal', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Tocilog', 'Filipino-style tocino with garlic rice and egg', 130, 'rice-meal', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Tori Rice Meal', 'Japanese-style chicken rice bowl with vegetables', 249, 'rice-meal', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Garlic Parmesan Chicken', 'Crispy chicken with garlic parmesan sauce and rice', 130, 'rice-meal', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('HeSarap Chicken Bites', 'Flavorful chicken bites with rice and sauce', 130, 'rice-meal', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- SANDWICHES
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Grilled Cheese Panini', 'Classic grilled cheese sandwich with crispy bread', 75, 'sandwich', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Sunburnt Peanut Butter', 'Unique peanut butter sandwich with special seasoning', 55, 'sandwich', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Ham & Cheese Panini', 'Delicious ham and cheese pressed sandwich', 85, 'sandwich', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Chicken Panini', 'Grilled chicken with vegetables and sauce', 95, 'sandwich', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Egg & Cheese Panini', 'Fresh eggs with melted cheese on pressed bread', 65, 'sandwich', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Ham, Egg & Cheese Panini', 'Complete breakfast sandwich with ham, egg, and cheese', 90, 'sandwich', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- PASTA, PULUTAN & SIDES
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Carbonara', 'Creamy pasta with bacon, eggs, and parmesan cheese', 120, 'pasta', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Spaghetti', 'Classic spaghetti with meat sauce and herbs', 120, 'pasta', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Loaded Nachos', 'Crispy nachos loaded with cheese, jalapeños, and toppings', 120, 'pulutan', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('French Fries', 'Golden crispy french fries with salt', 75, 'side', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Onion Rings (Double Trouble)', 'Double-battered crispy onion rings', 120, 'side', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Nachos', 'Classic nachos with cheese sauce', 90, 'side', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Tacos', 'Crispy tacos with your choice of filling', 90, 'side', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Mini Quesadilla', 'Small quesadillas with cheese and fillings', 90, 'side', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- SIGNATURE ITEMS
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Signature Sandwich (w/ iced tea)', 'Our famous signature sandwich served with refreshing iced tea', 180, 'signature', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Signature Sandwich (Solo)', 'Our famous signature sandwich served alone', 75, 'signature', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Cauli Crunch w/ Honey (w/ rice)', 'Crispy cauliflower with honey glaze served with rice', 250, 'signature', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Cauli Crunch (Solo)', 'Crispy cauliflower with honey glaze', 120, 'signature', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Crispy Cheesy Fries', 'Golden fries loaded with melted cheese and toppings', 180, 'signature', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'),
  ('Signature Fries (w/ toppings)', 'Our special fries with premium toppings and sauce', 250, 'signature', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop');

-- Insert Variations for Size-based items

-- Espresso drinks with size variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Americano Plain
  ((SELECT id FROM menu_items WHERE name = 'Americano (Plain)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Plain)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Plain)'), 'Large', 20),
  
  -- Americano Orange
  ((SELECT id FROM menu_items WHERE name = 'Americano (Orange)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Orange)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Orange)'), 'Large', 20),
  
  -- Americano Latte
  ((SELECT id FROM menu_items WHERE name = 'Americano (Latte)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Latte)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Latte)'), 'Large', 20),
  
  -- Cappuccino Plain
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Plain)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Plain)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Plain)'), 'Large', 20),
  
  -- Cappuccino Flavored
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Large', 20),
  
  -- Spanish Latte Plain
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Plain)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Plain)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Plain)'), 'Large', 20),
  
  -- Spanish Latte Flavored
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Flavored)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Flavored)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Flavored)'), 'Large', 20),
  
  -- Mocha Flavored
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Large', 20),
  
  -- Matcha Series
  ((SELECT id FROM menu_items WHERE name = 'Matcha Latte'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Latte'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Latte'), 'Large', 20),
  
  ((SELECT id FROM menu_items WHERE name = 'Ichigo Matcha'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Ichigo Matcha'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Ichigo Matcha'), 'Large', 20),
  
  ((SELECT id FROM menu_items WHERE name = 'Dirty Matcha'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Dirty Matcha'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Dirty Matcha'), 'Large', 20),
  
  -- Blended Drinks
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Medium', 15),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Large', 55),
  
  -- Hot Chocolate
  ((SELECT id FROM menu_items WHERE name = 'Hot Chocolate'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Hot Chocolate'), 'Large', 20),
  
  -- Iced Tea
  ((SELECT id FROM menu_items WHERE name = 'Iced Tea'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Iced Tea'), 'Large', 20),
  ((SELECT id FROM menu_items WHERE name = 'Iced Tea'), 'Pitcher', 85),
  
  -- Soft Drinks
  ((SELECT id FROM menu_items WHERE name = 'Soft Drinks'), 'Small', 0),
  ((SELECT id FROM menu_items WHERE name = 'Soft Drinks'), 'Medium', 10),
  ((SELECT id FROM menu_items WHERE name = 'Soft Drinks'), 'Large', 15),
  ((SELECT id FROM menu_items WHERE name = 'Soft Drinks'), 'Extra Large', 20);

-- Insert Add-ons for menu items

-- Add add-ons to espresso drinks
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  -- Americano drinks
  ((SELECT id FROM menu_items WHERE name = 'Americano (Plain)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Plain)'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Orange)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Orange)'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Latte)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Americano (Latte)'), 'Whipped Cream', 15, 'Toppings'),
  
  -- Cappuccino drinks
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Plain)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Plain)'), 'Cinnamon', 10, 'Spices'),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Cinnamon', 10, 'Spices'),
  ((SELECT id FROM menu_items WHERE name = 'Cappuccino (Flavored)'), 'Vanilla Syrup', 15, 'Syrups'),
  
  -- Spanish Latte drinks
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Plain)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Flavored)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Spanish Latte (Flavored)'), 'Caramel Sauce', 20, 'Sauces'),
  
  -- Mocha
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Chocolate Sauce', 20, 'Sauces'),
  ((SELECT id FROM menu_items WHERE name = 'Mocha (Flavored)'), 'Whipped Cream', 15, 'Toppings'),
  
  -- Matcha drinks
  ((SELECT id FROM menu_items WHERE name = 'Matcha Latte'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Latte'), 'Coconut Flakes', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Ichigo Matcha'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Dirty Matcha'), 'Espresso Shot', 30, 'Coffee'),
  ((SELECT id FROM menu_items WHERE name = 'Dirty Matcha'), 'Whipped Cream', 15, 'Toppings'),
  
  -- Blended drinks
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Oreo', 20, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Snickers', 25, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Caramel Sauce', 20, 'Sauces'),
  ((SELECT id FROM menu_items WHERE name = 'All Blended Flavors'), 'Chocolate Sauce', 20, 'Sauces'),
  
  -- Hot Chocolate
  ((SELECT id FROM menu_items WHERE name = 'Hot Chocolate'), 'Whipped Cream', 15, 'Toppings'),
  ((SELECT id FROM menu_items WHERE name = 'Hot Chocolate'), 'Cinnamon', 10, 'Spices');

-- Add add-ons to sandwiches
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  ((SELECT id FROM menu_items WHERE name = 'Grilled Cheese Panini'), 'Grilled Onions', 30, 'Vegetables'),
  ((SELECT id FROM menu_items WHERE name = 'Grilled Cheese Panini'), 'French Fries', 20, 'Sides'),
  ((SELECT id FROM menu_items WHERE name = 'Grilled Cheese Panini'), 'Iced Tea', 20, 'Beverages'),
  ((SELECT id FROM menu_items WHERE name = 'Sunburnt Peanut Butter'), 'French Fries', 20, 'Sides'),
  ((SELECT id FROM menu_items WHERE name = 'Ham & Cheese Panini'), 'Grilled Onions', 30, 'Vegetables'),
  ((SELECT id FROM menu_items WHERE name = 'Ham & Cheese Panini'), 'French Fries', 20, 'Sides'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Panini'), 'Grilled Onions', 30, 'Vegetables'),
  ((SELECT id FROM menu_items WHERE name = 'Chicken Panini'), 'French Fries', 20, 'Sides'),
  ((SELECT id FROM menu_items WHERE name = 'Egg & Cheese Panini'), 'French Fries', 20, 'Sides'),
  ((SELECT id FROM menu_items WHERE name = 'Ham, Egg & Cheese Panini'), 'Grilled Onions', 30, 'Vegetables'),
  ((SELECT id FROM menu_items WHERE name = 'Ham, Egg & Cheese Panini'), 'French Fries', 20, 'Sides');

-- Add extras to rice meals
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  ((SELECT id FROM menu_items WHERE name = 'Tonkatsu'), 'Rice (Solo)', 25, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tonkatsu'), 'Rice (With Side)', 50, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tonkatsu'), 'Fried Egg', 15, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tonkatsu'), 'Fried Garlic', 10, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tonkatsu'), 'Fried Onions', 10, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tocilog'), 'Rice (Solo)', 25, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tocilog'), 'Fried Egg', 15, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Tori Rice Meal'), 'Fried Egg', 15, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Garlic Parmesan Chicken'), 'Rice (Solo)', 25, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Garlic Parmesan Chicken'), 'Fried Egg', 15, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'HeSarap Chicken Bites'), 'Rice (Solo)', 25, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'HeSarap Chicken Bites'), 'Fried Egg', 15, 'Extras');

-- Add extras to pasta
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  ((SELECT id FROM menu_items WHERE name = 'Carbonara'), 'Fried Garlic', 10, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Carbonara'), 'Fried Onions', 10, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Spaghetti'), 'Fried Garlic', 10, 'Extras'),
  ((SELECT id FROM menu_items WHERE name = 'Spaghetti'), 'Fried Onions', 10, 'Extras');


