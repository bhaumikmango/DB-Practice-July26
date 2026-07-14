INSERT INTO users (name, email, password_hash) VALUES
('Alice Johnson',   'alice@example.com',   'hashed_pw_1'),
('Ben Carter',      'ben@example.com',     'hashed_pw_2'),
('Chloe Davies',    'chloe@example.com',   'hashed_pw_3'),
('Daniel Evans',    'daniel@example.com',  'hashed_pw_4'),
('Emma Foster',     'emma@example.com',    'hashed_pw_5'),
('Frank Green',     'frank@example.com',   'hashed_pw_6'),
('Grace Hall',      'grace@example.com',   'hashed_pw_7'),
('Henry Ibrahim',   'henry@example.com',   'hashed_pw_8'),
('Isla Jenkins',    'isla@example.com',    'hashed_pw_9'),
('Jack Kumar',      'jack@example.com',    'hashed_pw_10');
 
INSERT INTO properties
(title, town, description, property_type, property_area, carpet_area, bedrooms, price, price_period, age_of_property, status) VALUES
('Cressbrook Drive, Gt Cambourne', 'Cambridge',
 'A modern two bedroom house located in the Cambourne village development located to the West of Cambridge.',
 'house', 850.00, 720.00, 2, 650.00, 'monthly', 8, 'to_let'),
 
('Grenadier Walk Hardwick', 'Cambridge',
 'Modern first floor flat in a popular village with local shop and pub and easy access to Cambridge A14 and M11.',
 'flat', 480.00, 400.00, 1, 525.00, 'monthly', 12, 'to_let'),
 
('Stonefield Bar Hill', 'Cambridge',
 'A modern home situated within the village of Bar Hill close to local shops and facilities providing good access to the A14.',
 'house', 780.00, 650.00, 2, 580.00, 'monthly', 10, 'to_let'),
 
('Chesterton Road', 'Cambridge',
 'One single furnished room available in this five bedroom Victorian terraced house with easy access to the City Centre.',
 'room', 150.00, 130.00, 1, 290.00, 'monthly', 90, 'to_let'),
 
('Milton Road', 'Cambridge',
 'Bright two bedroom flat close to Milton Country Park with allocated parking.',
 'flat', 620.00, 540.00, 2, 700.00, 'monthly', 15, 'to_let'),
 
('Arbury Park', 'Cambridge',
 'Spacious three bedroom family house with garden, close to local schools.',
 'house', 1050.00, 900.00, 3, 950.00, 'monthly', 5, 'to_let'),
 
('Kings Hedges Road', 'Cambridge',
 'Compact studio apartment ideal for a single professional, walking distance to the Science Park.',
 'studio', 320.00, 280.00, 1, 480.00, 'monthly', 20, 'to_let'),
 
('Trumpington Meadows', 'Cambridge',
 'Newly built four bedroom house in a modern development with excellent transport links.',
 'house', 1300.00, 1100.00, 4, 1200.00, 'monthly', 2, 'to_let'),
 
('Histon Road', 'Cambridge',
 'Two bedroom flat above shops, recently renovated with new kitchen and bathroom.',
 'flat', 560.00, 470.00, 2, 675.00, 'monthly', 30, 'let_agreed'),
 
('Cherry Hinton Road', 'Cambridge',
 'Single room to let in a shared house, all bills included, close to Cherry Hinton Hall.',
 'room', 140.00, 120.00, 1, 310.00, 'monthly', 60, 'under_offer');
 
INSERT INTO property_images (property_id, image_url, image_type, display_order) VALUES
(1,  '/images/cressbrook_drive_1.jpg',       'primary', 1),
(2,  '/images/grenadier_walk_1.jpg',          'primary', 1),
(3,  '/images/stonefield_bar_hill_1.jpg',     'primary', 1),
(4,  '/images/chesterton_road_1.jpg',         'primary', 1),
(5,  '/images/milton_road_1.jpg',             'primary', 1),
(6,  '/images/arbury_park_1.jpg',             'primary', 1),
(7,  '/images/kings_hedges_road_1.jpg',       'primary', 1),
(8,  '/images/trumpington_meadows_1.jpg',     'primary', 1),
(9,  '/images/histon_road_1.jpg',             'primary', 1),
(10, '/images/cherry_hinton_road_1.jpg',      'primary', 1);
 
INSERT INTO saved_properties (user_id, property_id, price_at_time_of_saving) VALUES
(1, 1, 650.00),
(1, 3, 580.00),
(2, 4, 290.00),
(3, 5, 700.00),
(4, 6, 950.00),
(5, 7, 480.00),
(6, 8, 1200.00),
(7, 9, 675.00),
(8, 10, 310.00),
(9, 2, 525.00);
