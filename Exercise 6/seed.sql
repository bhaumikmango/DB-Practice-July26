-- CATEGORIES
INSERT INTO categories (name, carbon_multiplier) VALUES
('Electronics', 6.500),
('Textiles', 2.100),
('Woodworking', 1.800),
('Small Appliances', 4.300),
('Bicycles', 3.000),
('Furniture', 1.500),
('Garden Tools', 2.700),
('Toys', 1.900),
('Ceramics', 1.200),
('Musical Instruments', 3.500);

-- MEMBERS
INSERT INTO members (full_name, email, phone, joined_date) VALUES
('Asha Patel', 'asha.patel@example.com', '9820011223', '2024-01-15'),
('Ravi Shah', 'ravi.shah@example.com', '9820011224', '2024-02-10'),
('Meera Nair', 'meera.nair@example.com', '9820011225', '2024-02-20'),
('Karan Mehta', 'karan.mehta@example.com', '9820011226', '2024-03-05'),
('Priya Desai', 'priya.desai@example.com', '9820011227', '2024-03-18'),
('Arjun Iyer', 'arjun.iyer@example.com', '9820011228', '2024-04-01'),
('Sneha Rao', 'sneha.rao@example.com', '9820011229', '2024-04-22'),
('Vikram Joshi', 'vikram.joshi@example.com', '9820011230', '2024-05-09'),
('Neha Kulkarni', 'neha.kulkarni@example.com', '9820011231', '2024-05-30'),
('Rohan Bhatt', 'rohan.bhatt@example.com', '9820011232', '2024-06-12');

-- VOLUNTEERS 
INSERT INTO volunteers (full_name, email, is_active, on_shift) VALUES
('Dev Kapoor', 'dev.kapoor@example.com', TRUE, TRUE),
('Isha Malhotra', 'isha.malhotra@example.com', TRUE, FALSE),
('Aditya Verma', 'aditya.verma@example.com', TRUE, TRUE),
('Kavya Reddy', 'kavya.reddy@example.com', TRUE, FALSE),
('Nikhil Choudhary', 'nikhil.choudhary@example.com', TRUE, TRUE),
('Tara Menon', 'tara.menon@example.com', FALSE, FALSE),
('Farhan Ali', 'farhan.ali@example.com', TRUE, TRUE),
('Ritu Saxena', 'ritu.saxena@example.com', TRUE, FALSE),
('Om Trivedi', 'om.trivedi@example.com', TRUE, TRUE),
('Divya Pillai', 'divya.pillai@example.com', TRUE, FALSE);

-- VOLUNTEER_SPECIALTIES
INSERT INTO volunteer_specialties (volunteer_id, category_id) VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 3),
(4, 5),
(5, 1),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- TOOLS
INSERT INTO tools (name, category_id, status, shelf_location, calibration_interval_days) VALUES
('Soldering Iron', 1, 'available', 'A1-01', 180),
('Sewing Machine', 2, 'checked_out', 'B2-04', 365),
('Table Saw', 3, 'in_repair', 'C3-02', 90),
('Multimeter', 1, 'available', 'A1-05', 180),
('Bike Repair Stand', 5, 'available', 'D1-01', 365),
('Drill Press', 3, 'available', 'C3-05', 120),
('Hedge Trimmer', 7, 'checked_out', 'E2-01', 90),
('Overlocker', 2, 'available', 'B2-06', 365),
('Kiln', 9, 'retired', 'F1-01', 180),
('Guitar String Winder', 10, 'available', 'G1-02', 365);

-- CALIBRATION_LOGS
INSERT INTO calibration_logs (tool_id, technician_id, check_date, result, notes) VALUES
(1, 1, '2025-01-10', 'pass', 'Heating element within spec'),
(2, 2, '2025-02-15', 'pass', 'Tension calibrated'),
(3, 3, '2025-03-01', 'fail', 'Blade guard misaligned, locked for repair'),
(4, 1, '2025-01-20', 'pass', 'Reads accurate on reference resistor'),
(5, 5, '2025-04-05', 'pass', 'Stand clamp tightened'),
(6, 3, '2025-03-20', 'pass', 'Chuck runout acceptable'),
(7, 7, '2025-05-01', 'pass', 'Blade sharpened'),
(8, 2, '2025-02-28', 'pass', 'Timing belt checked'),
(9, 9, '2024-11-15', 'fail', 'Element cracked, retired'),
(10, 9, '2025-06-10', 'pass', 'Gear mechanism smooth');

-- TOOL_LOANS
INSERT INTO tool_loans (tool_id, member_id, checkout_date, due_date, return_date) VALUES
(2, 1, '2025-06-01', '2025-06-08', '2025-06-07'),
(5, 2, '2025-06-05', '2025-06-12', '2025-06-11'),
(7, 3, '2025-06-10', '2025-06-17', NULL),
(1, 4, '2025-06-12', '2025-06-19', '2025-06-18'),
(4, 5, '2025-06-15', '2025-06-22', NULL),
(6, 6, '2025-06-18', '2025-06-25', '2025-06-24'),
(8, 7, '2025-06-20', '2025-06-27', NULL),
(10, 8, '2025-06-22', '2025-06-29', '2025-06-28'),
(5, 9, '2025-06-25', '2025-07-02', NULL),
(2, 10, '2025-06-28', '2025-07-05', NULL);

-- REPAIR_TICKETS
INSERT INTO repair_tickets (member_id, category_id, assigned_volunteer_id, item_name, weight_kg, status, symptom_notes, created_at, completed_at) VALUES
(1, 1, 1, 'Toaster', 1.200, 'completed', 'Not heating', '2025-05-01 09:00', '2025-05-03 15:00'),
(2, 2, 2, 'Denim Jacket', 0.800, 'completed', 'Torn sleeve seam', '2025-05-02 10:00', '2025-05-02 16:00'),
(3, 3, 3, 'Wooden Chair', 4.500, 'in_progress', 'Broken leg joint', '2025-05-10 11:00', NULL),
(4, 1, 5, 'Bluetooth Speaker', 0.600, 'diagnosing', 'No sound output', '2025-05-12 12:00', NULL),
(5, 5, 4, 'Bicycle', 12.000, 'awaiting_parts', 'Flat tire, brake worn', '2025-05-15 09:30', NULL),
(6, 6, NULL, 'Coffee Table', 8.000, 'intake', 'Wobbly leg', '2025-06-01 10:15', NULL),
(7, 7, 7, 'Hedge Trimmer', 2.300, 'completed', 'Motor overheating', '2025-05-20 13:00', '2025-05-22 17:00'),
(8, 8, NULL, 'Toy Truck', 0.400, 'intake', 'Wheel detached', '2025-06-05 14:00', NULL),
(9, 9, 9, 'Ceramic Vase', 1.000, 'completed', 'Cracked base', '2025-05-25 08:45', '2025-05-26 12:00'),
(10, 10, 9, 'Acoustic Guitar', 2.800, 'in_progress', 'String buzz', '2025-06-08 09:00', NULL);

-- PARTS
INSERT INTO parts (name, drawer_location, stock_qty, min_threshold) VALUES
('M3 Screw', 'P1-A', 200, 50),
('5A Fuse', 'P1-B', 15, 20),
('Resistor 220ohm', 'P1-C', 300, 100),
('Sewing Thread Spool', 'P2-A', 40, 10),
('Bike Brake Pad', 'P2-B', 8, 10),
('Wood Glue Bottle', 'P3-A', 25, 5),
('Table Leg Bracket', 'P3-B', 12, 5),
('LED Light 5mm', 'P1-D', 150, 30),
('Guitar String Set', 'P4-A', 18, 5),
('Ceramic Adhesive', 'P4-B', 6, 5);

-- TICKET_PARTS_USED
INSERT INTO ticket_parts_used (ticket_id, part_id, qty_used, used_at) VALUES
(1, 3, 2, '2025-05-03 14:00'),
(1, 2, 1, '2025-05-03 14:05'),
(2, 4, 1, '2025-05-02 15:30'),
(3, 7, 1, '2025-05-11 10:00'),
(3, 6, 1, '2025-05-11 10:05'),
(5, 5, 2, '2025-05-16 09:00'),
(7, 2, 1, '2025-05-22 16:00'),
(9, 10, 1, '2025-05-26 11:30'),
(10, 9, 1, '2025-06-09 10:00'),
(4, 8, 3, '2025-05-13 09:00');
