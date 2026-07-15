-- 1. ARTIST
INSERT INTO artist (name) VALUES
('The Midnight Echoes'),
('Sarah Vance'),
('Crimson Tide Collective'),
('DJ Nova'),
('The Wandering Souls'),
('Elena Marquez'),
('Static Bloom'),
('The Rusty Anchors'),
('Kai Osei'),
('Velvet Horizon');

-- 2. CD
INSERT INTO cd (title, price, genre, artist_id) VALUES
('Neon Nights',            12.99, 'Synthwave',   1),
('Quiet Rooms',            9.99,  'Folk',        2),
('Blood and Static',       14.50, 'Rock',        3),
('Nova Sessions Vol. 1',   11.25, 'Electronic',  4),
('Roadside Hymns',         10.00, 'Country',     5),
('Marquez Live',           15.99, 'Jazz',        6),
('Bloom Cycle',            13.49, 'Indie',       7),
('Anchors Down',           8.99,  'Sea Shanty',  8),
('Osei Rhythms',           12.00, 'Afrobeat',    9),
('Neon Nights (Deluxe)',   16.99, 'Synthwave',   1); 

-- 3. TRACK
INSERT INTO track (title, running_time) VALUES
('Opening Drift',        210),
('City Lights',          185),
('Static Hymn',          240),
('Rebuild',              198),
('Slow Fade',            265),
('Wandering Home',       220),
('Bloom',                175),
('Anchor Point',         230),
('Osei Groove',          205),
('Reprise (Neon Nights)',150);  

-- 4. CD_TRACK 
INSERT INTO cd_track (cd_id, track_id) VALUES
(1, 1),   
(1, 2),   
(1, 10),  
(2, 4),   
(3, 3),   
(4, 9),   
(5, 6),   
(6, 5),   
(7, 7),   
(10, 10); 
