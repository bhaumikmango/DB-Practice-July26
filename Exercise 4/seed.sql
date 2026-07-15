-- PLANT
INSERT INTO plant (scientific_name, common_name, family, genus, species, growth_habit) VALUES
('Solanum lycopersicum', 'Tomato',         'Solanaceae',   'Solanum',     'lycopersicum', 'ANNUAL'),
('Ocimum basilicum',     'Basil',          'Lamiaceae',    'Ocimum',      'basilicum',    'ANNUAL'),
('Lactuca sativa',       'Lettuce',        'Asteraceae',   'Lactuca',     'sativa',       'ANNUAL'),
('Capsicum annuum',      'Bell Pepper',    'Solanaceae',   'Capsicum',    'annuum',       'ANNUAL'),
('Cucumis sativus',      'Cucumber',       'Cucurbitaceae','Cucumis',     'sativus',      'ANNUAL'),
('Spinacia oleracea',    'Spinach',        'Amaranthaceae','Spinacia',    'oleracea',     'ANNUAL'),
('Fragaria vesca',       'Strawberry',     'Rosaceae',     'Fragaria',    'vesca',        'PERENNIAL'),
('Mentha spicata',       'Mint',           'Lamiaceae',    'Mentha',      'spicata',      'PERENNIAL'),
('Salvia rosmarinus',    'Rosemary',       'Lamiaceae',    'Salvia',      'rosmarinus',   'PERENNIAL'),
('Tagetes erecta',       'Marigold',       'Asteraceae',   'Tagetes',     'erecta',       'BIENNIAL');

-- GREENHOUSE 
INSERT INTO greenhouse (name, location) VALUES
('Greenhouse A', 'North Field, Block 1'),
('Greenhouse B', 'North Field, Block 2'),
('Greenhouse C', 'South Field, Block 1'),
('Greenhouse D', 'South Field, Block 2'),
('Greenhouse E', 'East Wing, Bay 1'),
('Greenhouse F', 'East Wing, Bay 2'),
('Greenhouse G', 'West Wing, Bay 1'),
('Greenhouse H', 'West Wing, Bay 2'),
('Greenhouse I', 'Research Annex, Room 1'),
('Greenhouse J', 'Research Annex, Room 2');

-- SUBSTRATE_TYPE
INSERT INTO substrate_type (type_name, description) VALUES
('Peat Moss',    'High water retention, naturally acidic organic substrate'),
('Perlite',      'Lightweight volcanic glass, improves drainage and aeration'),
('Vermiculite',  'Mineral substrate that retains moisture and nutrients'),
('Coco Coir',    'Coconut husk fiber, sustainable peat alternative'),
('Sand',         'Coarse mineral substrate, excellent drainage, low retention'),
('Loam',         'Balanced mix of sand, silt, and clay'),
('Clay Pellets',  'Expanded clay aggregate, used in hydroponic-style trays'),
('Rockwool',     'Spun mineral fiber, sterile and inert'),
('Sphagnum Moss','Fibrous moss substrate, high moisture retention'),
('Bark Mix',     'Composted bark blend, good structure for root aeration');

-- FERTILIZER
INSERT INTO fertilizer (name, npk_ratio, manufacturer) VALUES
('GrowFast Original',    '10-10-10', 'AgriBoost Labs'),
('BloomMax',              '5-15-10', 'AgriBoost Labs'),
('RootStrong',            '15-5-5',  'GreenField Co.'),
('LeafGreen Plus',        '20-5-10', 'GreenField Co.'),
('BalanceGro',            '12-12-12','NutriSoil Inc.'),
('SeedlingStart',         '3-8-5',   'NutriSoil Inc.'),
('FruitBoost',            '6-12-18', 'HarvestTech'),
('OrganiFeed',            '4-4-4',   'HarvestTech'),
('MicroBoost Trace',      '2-2-2',   'PureGrow Labs'),
('AquaNutrient Blend',    '9-9-9',   'PureGrow Labs');

-- TRAY 
INSERT INTO tray (greenhouse_id, substrate_type_id, soil_ph, planting_date, is_control) VALUES
(1,  1,  6.20, '2026-03-01', TRUE),
(2,  2,  6.50, '2026-03-01', FALSE),
(3,  3,  6.80, '2026-03-02', FALSE),
(4,  4,  6.10, '2026-03-02', FALSE),
(5,  5,  7.00, '2026-03-03', TRUE),
(6,  6,  6.40, '2026-03-03', FALSE),
(7,  7,  5.90, '2026-03-04', FALSE),
(8,  8,  6.60, '2026-03-04', FALSE),
(9,  9,  6.30, '2026-03-05', TRUE),
(10, 10, 6.70, '2026-03-05', FALSE);

-- ENVIRONMENT_READING
INSERT INTO environment_reading
    (greenhouse_id, temperature, temperature_unit, luminosity, luminosity_unit, humidity, co2_level, sensor_id, reading_timestamp) VALUES
(1,  22.50, 'C', 450.00, 'PPFD', 65.00, 420.00, 'SENSOR-A1', '2026-03-10 08:00:00'),
(2,  23.10, 'C', 480.00, 'PPFD', 62.50, 415.00, 'SENSOR-B1', '2026-03-10 08:00:00'),
(3,  21.80, 'C', 15000.00, 'LUX', 68.00, 430.00, 'SENSOR-C1', '2026-03-10 08:00:00'),
(4,  24.00, 'C', 16500.00, 'LUX', 60.00, 410.00, 'SENSOR-D1', '2026-03-10 08:00:00'),
(5,  22.90, 'C', 470.00, 'PPFD', 64.00, 425.00, 'SENSOR-E1', '2026-03-10 08:00:00'),
(6,  23.40, 'C', 460.00, 'PPFD', 63.00, 418.00, 'SENSOR-F1', '2026-03-10 08:00:00'),
(7,  20.90, 'C', 14000.00, 'LUX', 70.00, 440.00, 'SENSOR-G1', '2026-03-10 08:00:00'),
(8,  24.60, 'C', 17000.00, 'LUX', 58.50, 405.00, 'SENSOR-H1', '2026-03-10 08:00:00'),
(9,  22.20, 'C', 455.00, 'PPFD', 66.00, 422.00, 'SENSOR-I1', '2026-03-10 08:00:00'),
(10, 23.70, 'C', 465.00, 'PPFD', 61.50, 412.00, 'SENSOR-J1', '2026-03-10 08:00:00');

-- FERTILIZER_APPLICATION
INSERT INTO fertilizer_application (tray_id, fertilizer_id, dilution_ratio, date_applied) VALUES
(1,  1,  '1:0 (control - no fertilizer)', '2026-03-01'),
(2,  2,  '1:100', '2026-03-01'),
(3,  3,  '1:150', '2026-03-02'),
(4,  4,  '1:200', '2026-03-02'),
(5,  5,  '1:0 (control - no fertilizer)', '2026-03-03'),
(6,  6,  '1:120', '2026-03-03'),
(7,  7,  '1:80',  '2026-03-04'),
(8,  8,  '1:250', '2026-03-04'),
(9,  9,  '1:0 (control - no fertilizer)', '2026-03-05'),
(10, 10, '1:100', '2026-03-05');

-- PLANT_GROUP
INSERT INTO plant_group (tray_id, plant_id, quantity) VALUES
(1,  1,  12),
(2,  2,  20),
(3,  3,  15),
(4,  4,  10),
(5,  5,  8),
(6,  6,  18),
(7,  7,  6),
(8,  8,  14),
(9,  9,  10),
(10, 10, 16);

-- TRAY_CONCLUSION 
INSERT INTO tray_conclusion (tray_id, date_recorded, result_category, summary_notes) VALUES
(1,  '2026-04-10', 'INCONCLUSIVE', 'Control tray showed baseline growth as expected, no fertilizer applied.'),
(2,  '2026-04-10', 'SUCCESS',      'Noticeable increase in leaf density and height compared to control.'),
(3,  '2026-04-11', 'SUCCESS',      'Root development improved significantly; recommend further trials.'),
(4,  '2026-04-11', 'FAILURE',      'Signs of nutrient burn on leaf tips; dilution likely too strong.'),
(5,  '2026-04-12', 'INCONCLUSIVE', 'Control tray for strawberry group, stable but slow growth as expected.'),
(6,  '2026-04-12', 'SUCCESS',      'Consistent growth improvement across all plants in the group.'),
(7,  '2026-04-13', 'INCONCLUSIVE', 'Mixed results; some individuals thrived, others stagnated.'),
(8,  '2026-04-13', 'SUCCESS',      'Strong root and shoot growth, best performing tray in the batch.'),
(9,  '2026-04-14', 'INCONCLUSIVE', 'Control tray for marigold group, healthy but unremarkable growth.'),
(10, '2026-04-14', 'FAILURE',      'Wilting observed mid-trial, possibly unrelated to fertilizer treatment.');

-- GROWTH_OBSERVATION 
INSERT INTO growth_observation (plant_group_id, observation_date, height, health_rating, comment) VALUES
(1,  '2026-03-15', 8.50,  4, 'Healthy, even growth across the group.'),
(2,  '2026-03-15', 11.20, 5, 'Vigorous growth, strong stem color.'),
(3,  '2026-03-16', 6.80,  4, NULL),
(4,  '2026-03-16', 9.10,  3, 'Slight yellowing on a few leaves.'),
(5,  '2026-03-17', 5.40,  4, 'Normal growth for this stage.'),
(6,  '2026-03-17', 10.60, 5, 'Best performer in the batch so far.'),
(7,  '2026-03-18', 4.20,  3, 'Slower growth than expected.'),
(8,  '2026-03-18', 9.80,  4, NULL),
(9,  '2026-03-19', 7.30,  4, 'Consistent with control expectations.'),
(10, '2026-03-19', 8.90,  2, 'Wilting observed on two plants in the group.');

COMMIT;
