-- 1. ROOM
INSERT INTO room (name, theme, status, default_timer_duration_seconds, low_time_warning_seconds) VALUES
('Pharaoh''s Tomb', 'Egyptian Tomb Heist', 'ACTIVE', 3600, 300),
('Cyberpunk Heist', 'Neon Corporate Espionage', 'ACTIVE', 3000, 300),
('The Vault', 'Bank Heist Standoff', 'READY', 3600, 300),
('Haunted Asylum', 'Abandoned Psychiatric Ward', 'MAINTENANCE', 3600, 300),
('Pirate''s Cove', 'Shipwreck Treasure Hunt', 'READY', 3300, 300),
('Space Station Zero', 'Zero Gravity Sabotage', 'READY', 3600, 240),
('Wizard''s Study', 'Arcane Library Mystery', 'ACTIVE', 3000, 300),
('Detective''s Office', 'Noir Murder Mystery', 'READY', 3600, 300),
('Jungle Temple', 'Lost Idol Expedition', 'MAINTENANCE', 3300, 300),
('Casino Royale', 'High Stakes Vault Break', 'READY', 3600, 300);

-- 2. DEVICE
INSERT INTO device (name, type, status, room_id) VALUES
('Sarcophagus Lid Sensor', 'SENSOR', 'ONLINE', 1),
('Keycard Reader Sensor', 'SENSOR', 'ONLINE', 2),
('Vault Door Maglock', 'MAGLOCK', 'ONLINE', 3),
('Fog Machine Controller', 'MICROCONTROLLER', 'OFFLINE', 4),
('Ship Wheel Sensor', 'SENSOR', 'ONLINE', 5),
('Airlock Maglock', 'MAGLOCK', 'ONLINE', 6),
('Bookshelf Sensor', 'SENSOR', 'ONLINE', 7),
('Office Audio Board', 'AUDIO_BOARD', 'ONLINE', 8),
('Idol Pedestal Sensor', 'SENSOR', 'OFFLINE', 9),
('Vault Camera', 'CAMERA', 'ONLINE', 10);

-- 3. PUZZLE
INSERT INTO puzzle (name, sequence_order, clue_limit, room_id) VALUES
('Sarcophagus Padlock', 1, 3, 1),
('Laser Grid Corridor', 2, 3, 1),
('Bookshelf Magnet Wall', 3, 2, 1),
('Keycard Cipher', 1, 3, 2),
('Server Rack Rewire', 2, 3, 2),
('Vault Door Override', 3, 2, 2),
('Combination Dial', 1, 3, 3),
('Pressure Plate Floor', 2, 3, 3),
('Ancient Tome Cipher', 1, 3, 7),
('Star Chart Alignment', 2, 2, 7);

-- 4. CLUE
INSERT INTO clue (clue_content, clue_type, puzzle_id) VALUES
('Check the hieroglyphs above the door for a number sequence.', 'PRESET', 1),
('The scarab beetle marks the first digit.', 'PRESET', 1),
('Count the flashing intervals of the lasers.', 'PRESET', 2),
('Look for a hidden magnet behind the third book.', 'PRESET', 3),
('Cross-reference employee badge colors with the login screen.', 'PRESET', 4),
('The red wire is a decoy, follow the blue one.', 'PRESET', 5),
('Override code is hidden in the security footage.', 'PRESET', 6),
('Try the day, month, year of the founding plaque.', 'PRESET', 7),
('Translate the runes using the provided cipher wheel.', 'PRESET', 9),
('Align the constellations shown on the ceiling projector.', 'PRESET', 10);

-- 5. GAME_MASTER
INSERT INTO game_master (name, status) VALUES
('Ravi Shah', 'ACTIVE'),
('Meera Iyer', 'ACTIVE'),
('Alex Chen', 'INACTIVE'),
('Priya Nair', 'ACTIVE'),
('Karan Mehta', 'ACTIVE'),
('Sana Sheikh', 'INACTIVE'),
('Vikram Rao', 'ACTIVE'),
('Divya Menon', 'ACTIVE'),
('Farhan Ali', 'INACTIVE'),
('Neha Kapoor', 'ACTIVE');

-- 6. SESSION
INSERT INTO session (status, total_time_seconds, remaining_time_seconds, room_id, gm_id) VALUES
('ACTIVE', 3600, 1800, 1, 1),
('ACTIVE', 3000, 240, 2, 2),
('COMPLETED', 3600, 612, 3, 1),
('ABORTED', 3600, 2400, 9, 6),
('COMPLETED', 3300, 500, 5, 4),
('ACTIVE', 3600, 3000, 6, 7),
('COMPLETED', 3000, 800, 7, 2),
('EMERGENCY_STOPPED', 3600, 1500, 8, 5),
('COMPLETED', 3300, 400, 9, 9),
('ACTIVE', 3600, 3300, 10, 10);

-- 7. CLUE_DISPATCH
INSERT INTO clue_dispatch (session_id, puzzle_id, sent_by, sent_at, sent_clue) VALUES
(1, 1, 1, '2026-07-14 10:05:00', 1),
(1, 1, 1, '2026-07-14 10:09:00', 2),
(1, 2, 1, '2026-07-14 10:20:00', 3),
(1, 3, 1, '2026-07-14 10:32:00', 4),
(2, 4, 2, '2026-07-14 11:02:00', 5),
(2, 5, 2, '2026-07-14 11:15:00', 6),
(2, 6, 2, '2026-07-14 11:28:00', 7),
(3, 7, 1, '2026-07-13 09:10:00', 8),
(7, 9, 2, '2026-07-12 15:40:00', 9),
(7, 10, 2, '2026-07-12 15:55:00', 10);

-- 8. SESSION_PUZZLE_STATE
INSERT INTO session_puzzle_state (puzzle_id, session_id, stage_status, clues_used_so_far, force_override) VALUES
(1, 1, 'SOLVED', 2, 'FALSE'),
(2, 1, 'ACTIVE', 1, 'FALSE'),
(3, 1, 'LOCKED', 0, 'FALSE'),
(4, 2, 'SOLVED', 1, 'FALSE'),
(5, 2, 'ACTIVE', 1, 'FALSE'),
(6, 2, 'LOCKED', 0, 'FALSE'),
(7, 3, 'SOLVED', 1, 'FALSE'),
(8, 3, 'SOLVED', 0, 'TRUE'),
(9, 7, 'SOLVED', 1, 'FALSE'),
(10, 7, 'ACTIVE', 1, 'FALSE');
-- (session_id, puzzle_id) is the composite PK — 10 rows, all unique pairs

-- 9. EMERGENCY_STOP
INSERT INTO emergency_stop (used_by, used_at, reason) VALUES
(1, '2026-07-14 10:40:00', 'Fire alarm test drill'),
(2, '2026-07-14 11:32:00', 'Player medical concern - asthma'),
(5, '2026-07-11 14:05:00', 'Power flicker across building'),
(7, '2026-07-14 12:10:00', 'Unscheduled fire drill'),
(1, '2026-07-10 16:20:00', 'Player panic attack in Room 1'),
(4, '2026-07-09 09:00:00', 'Scheduled safety test'),
(10, '2026-07-14 13:00:00', 'Maglock malfunction suspected'),
(2, '2026-07-08 17:45:00', 'Building-wide breaker test'),
(8, '2026-07-07 12:15:00', 'Player injury - minor fall'),
(5, '2026-07-06 20:30:00', 'False smoke detector alarm');

-- 10. EMERGENCY_STOP_EFFECT
INSERT INTO emergency_stop_effect (stop_id, session_id, remaining_session_time_seconds) VALUES
(1, 1, 1750),
(1, 2, 200),
(2, 1, 1600),
(3, 6, 2900),
(4, 7, 750),
(5, 1, 1400),
(6, 3, 550),
(7, 10, 3200),
(8, 2, 180),
(10, 8, 1450);
-- (session_id, stop_id) is the composite PK — 10 rows, all unique pairs

-- 11. ACTIVITY_LOG
INSERT INTO activity_log (occurence_time, message_text, message_source, session_id, gm_id) VALUES
('2026-07-14 10:00:00', 'Session started for Pharaoh''s Tomb', 'SYSTEM', 1, NULL),
('2026-07-14 10:32:00', 'Puzzle Sarcophagus Padlock solved', 'SYSTEM', 1, NULL),
('2026-07-14 10:33:00', 'Clue dispatched to room screen', 'SYSTEM', 1, 1),
('2026-07-14 11:20:00', 'Player group seems stuck, sending hint manually', 'MANUAL', 2, 2),
('2026-07-05 08:00:00', 'Device disconnected: Fog Machine Controller', 'SYSTEM', NULL, NULL),
('2026-07-14 10:40:00', 'Emergency stop triggered - fire alarm drill', 'SYSTEM', 1, 1),
('2026-07-13 09:50:00', 'Session completed for The Vault', 'SYSTEM', 3, NULL),
('2026-07-12 15:56:00', 'Noted: player asked for hint in Hindi, translated manually', 'MANUAL', 7, 2),
('2026-07-11 14:10:00', 'Device reboot completed: Vault Door Maglock', 'SYSTEM', NULL, NULL),
('2026-07-14 13:20:00', 'GM observation: group very fast, ahead of schedule', 'MANUAL', 10, 10);
