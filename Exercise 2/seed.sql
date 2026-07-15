-- 1. User
INSERT INTO "user" (name, email, phone) VALUES
('Aarav Shah', 'aarav.shah@example.com', '9998887771'),
('Priya Mehta', 'priya.mehta@example.com', '9998887772'),
('Rohan Verma', 'rohan.verma@example.com', '9998887773'),
('Sneha Patel', 'sneha.patel@example.com', '9998887774'),
('Karan Malhotra', 'karan.malhotra@example.com', '9998887775'),
('Ananya Rao', 'ananya.rao@example.com', '9998887776'),
('Vikram Nair', 'vikram.nair@example.com', '9998887777'),
('Ishita Gupta', 'ishita.gupta@example.com', '9998887778'),
('Aditya Kumar', 'aditya.kumar@example.com', '9998887779'),
('Neha Joshi', 'neha.joshi@example.com', '9998887780');

-- 2. Property
INSERT INTO property (name, description, address, status) VALUES
('Sunset Villa', 'A cozy villa with a beautiful sunset view.', '12 Palm Street, Goa', 'active'),
('Mountain Retreat', 'Peaceful cabin surrounded by pine forests.', '45 Hillview Road, Manali', 'active'),
('Ocean Breeze Resort', 'Beachfront resort with multiple room types.', '7 Marine Drive, Mumbai', 'active'),
('City Central Hotel', 'Business hotel in the heart of the city.', '88 MG Road, Bangalore', 'active'),
('Lakeview Cottage', 'Quiet cottage overlooking the lake.', '3 Lakeside Lane, Nainital', 'active'),
('Desert Camp Stay', 'Traditional tents with modern comforts.', '21 Dune Road, Jaisalmer', 'active'),
('Riverside Homestay', 'Family-run homestay by the river.', '9 River Street, Rishikesh', 'active'),
('Heritage Haveli', 'Restored heritage property with royal charm.', '15 Old City Road, Jaipur', 'active'),
('Green Valley Farmstay', 'Farm stay experience with organic meals.', '30 Valley Road, Coorg', 'active'),
('Urban Loft Apartments', 'Modern loft apartments for short stays.', '5 Skyline Avenue, Pune', 'inactive');

-- 3. Accommodation Type
INSERT INTO accommodation_type (category_label) VALUES
('Single Room'),
('Double Room'),
('Suite'),
('Villa'),
('Cottage'),
('Tent'),
('Dormitory'),
('Studio Apartment'),
('Penthouse'),
('Cabin');

-- 4. Property + Accommodation Type (bookable units, with pricing)
INSERT INTO property_accommodation_type (property_id, type_id, price_per_day, quantity_available) VALUES
(1, 4, 4500.00, 2),   -- Sunset Villa - Villa
(2, 10, 3200.00, 3),  -- Mountain Retreat - Cabin
(3, 2, 2800.00, 5),   -- Ocean Breeze Resort - Double Room
(3, 3, 5200.00, 2),   -- Ocean Breeze Resort - Suite
(4, 1, 1800.00, 6),   -- City Central Hotel - Single Room
(4, 3, 4800.00, 2),   -- City Central Hotel - Suite
(5, 5, 2500.00, 3),   -- Lakeview Cottage - Cottage
(6, 6, 1500.00, 8),   -- Desert Camp Stay - Tent
(8, 9, 7500.00, 1),   -- Heritage Haveli - Penthouse
(9, 7, 1200.00, 10);  -- Green Valley Farmstay - Dormitory

-- 5. Facility
INSERT INTO facility (name) VALUES
('WiFi'),
('Parking'),
('Kitchen'),
('Air Conditioning'),
('Swimming Pool'),
('Laundry'),
('Hot Water'),
('Power Backup'),
('Elevator'),
('Housekeeping');

-- 6. Property <-> Facility
INSERT INTO property_facility (property_id, facility_id) VALUES
(1, 1), (1, 2), (1, 5),
(2, 1), (2, 7), (2, 8),
(3, 1), (3, 2), (3, 4), (3, 5),
(4, 1), (4, 4), (4, 9), (4, 10),
(5, 3), (5, 7),
(6, 2), (6, 7),
(7, 1), (7, 3),
(8, 1), (8, 2), (8, 6),
(9, 3), (9, 7);

-- 7. Entertainment
INSERT INTO entertainment (name) VALUES
('TV'),
('Gaming Console'),
('Pool Table'),
('Bonfire Setup'),
('Karaoke System'),
('Board Games'),
('Home Theater'),
('Live Music'),
('Bicycle Rental'),
('Kids Play Area');

-- 8. Property <-> Entertainment
INSERT INTO property_entertainment (property_id, entertainment_id) VALUES
(1, 1), (1, 4),
(2, 1), (2, 4), (2, 6),
(3, 1), (3, 3), (3, 7),
(4, 1), (4, 2), (4, 7),
(5, 4), (5, 6),
(6, 4), (6, 5), (6, 8),
(7, 6), (7, 9),
(8, 5), (8, 8),
(9, 4), (9, 10);

-- 9. Booking
INSERT INTO booking (user_id, property_accommodation_id, status, deposit_amount, duration_days) VALUES
(1, 1, 'confirmed', 1000.00, 3),
(2, 3, 'pending', 500.00, 2),
(3, 5, 'confirmed', 900.00, 1),
(4, 2, 'cancelled', 600.00, 4),
(5, 6, 'confirmed', 1500.00, 5),
(6, 4, 'pending', 800.00, 2),
(7, 7, 'confirmed', 300.00, 3),
(8, 9, 'confirmed', 2000.00, 2),
(9, 8, 'pending', 250.00, 6),
(10, 10, 'confirmed', 200.00, 1);
