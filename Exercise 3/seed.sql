-- 1. COUNTRY
INSERT INTO country (country_name, currency_code) VALUES
('United States', 'USD'),
('India', 'INR'),
('South Korea', 'KRW'),
('United Kingdom', 'GBP'),
('Spain', 'EUR'),
('Japan', 'JPY'),
('France', 'EUR'),
('Australia', 'AUD'),
('Thailand', 'THB'),
('Mexico', 'MXN');

-- 2. PLATFORM
INSERT INTO platform (platform_name) VALUES
('Theater'),
('Netflix'),
('Amazon Prime'),
('Disney+'),
('Hulu'),
('HBO Max'),
('Blu-ray/DVD'),
('JioCinema'),
('MX Player'),
('Apple TV+');

-- 3. GENRE
INSERT INTO genre (category_name) VALUES
('Horror'),
('Thriller'),
('Psychological'),
('Mystery'),
('Supernatural'),
('Slasher'),
('Found-footage'),
('Zombie'),
('Home Invasion'),
('Sci-fi Horror');

-- 4. TAG
INSERT INTO tag (tag_name) VALUES
('based_on_true_story'),
('jump-scare-heavy'),
('slow-burn'),
('folklore'),
('plot-twist'),
('gore'),
('atmospheric'),
('cult-classic'),
('franchise-starter'),
('anthology');

-- 5. PERSON
INSERT INTO person (name) VALUES
('Ari Aster'),
('Toni Collette'),
('James Wan'),
('Vera Farmiga'),
('Rahi Anil Barve'),
('Bong Joon-ho'),
('Song Kang-ho'),
('Jordan Peele'),
('Lupita Nyong''o'),
('Mike Flanagan');

-- 6. STUDIO
INSERT INTO studio (studio_name) VALUES
('A24'),
('New Line Cinema'),
('Eros International'),
('Netflix Studios'),
('Blumhouse'),
('Warner Bros'),
('Legendary Pictures'),
('RSVP Movies'),
('Screen Gems'),
('Ghost House Pictures');

-- 7. TITLE (10 movies + 10 series = 20 rows; see note below)
INSERT INTO title (name, release_year, type, country_id) VALUES
('Hereditary', 2018, 'movie', 1),
('The Conjuring', 2013, 'movie', 1),
('Tumbbad', 2018, 'movie', 2),
('Parasite', 2019, 'movie', 3),
('Get Out', 2017, 'movie', 1),
('A Quiet Place', 2018, 'movie', 1),
('Train to Busan', 2016, 'movie', 3),
('The Others', 2001, 'movie', 5),
('Ringu', 1998, 'movie', 6),
('Raw', 2016, 'movie', 7),
('Stranger Things', 2016, 'series', 1),
('The Haunting of Hill House', 2018, 'series', 1),
('Sacred Games', 2018, 'series', 2),
('Kingdom', 2019, 'series', 3),
('Black Mirror', 2011, 'series', 4),
('Midnight Mass', 2021, 'series', 1),
('The Fall', 2013, 'series', 4),
('Marianne', 2019, 'series', 7),
('Ju-On: Origins', 2020, 'series', 6),
('Money Heist', 2017, 'series', 5);

-- 8. MOVIE (title_id 1-10)
INSERT INTO movie (title_id, runtime_minutes) VALUES
(1, 127),
(2, 112),
(3, 104),
(4, 132),
(5, 104),
(6, 90),
(7, 118),
(8, 104),
(9, 96),
(10, 99);

-- 9. SERIES (title_id 11-20)
INSERT INTO series (title_id, status) VALUES
(11, 'ended'),
(12, 'ended'),
(13, 'ended'),
(14, 'ended'),
(15, 'ongoing'),
(16, 'ended'),
(17, 'ended'),
(18, 'ended'),
(19, 'ended'),
(20, 'ended');

-- 10. WATCH_EVENT
INSERT INTO watch_event (title_id, date_watched, rewatch_count, platform_id) VALUES
(1, '2023-10-15', 0, 1),
(1, '2024-10-28', 1, 2),
(2, '2022-06-01', 0, 2),
(3, '2023-03-10', 0, 3),
(4, '2020-02-14', 0, 2),
(5, '2021-05-20', 0, 4),
(6, '2019-08-09', 0, 1),
(11, '2021-01-05', 0, 2),
(13, '2022-07-19', 0, 8),
(15, '2020-11-11', 0, 6);

-- 11. REVIEW
INSERT INTO review (title_id, rating_scale, comments) VALUES
(1, 88, 'Slow burn but the ending is unforgettable.'),
(2, 76, 'Solid jump scares, classic haunted house formula.'),
(3, 91, 'Best Indian horror film I have seen, folklore done right.'),
(4, 96, 'Genre-bending masterpiece, thriller with social commentary.'),
(5, 89, 'Sharp social horror, great twist.'),
(6, 84, 'Tense, minimal dialogue, strong sound design.'),
(7, 87, 'Fast paced zombie thriller on a train.'),
(11, 82, 'Great nostalgia-driven thriller, later seasons dip a bit.'),
(13, 78, 'Gritty Mumbai crime thriller, strong first season.'),
(19, 74, 'Slow but eerie Ju-On origin story.');

-- 12. BOX_OFFICE_COLLECTION
INSERT INTO box_office_collection (title_id, region, amount, currency_code) VALUES
(1, 'home_country', 44000000.00, 'USD'),
(1, 'worldwide', 82000000.00, 'USD'),
(2, 'home_country', 137000000.00, 'USD'),
(2, 'india', 120000000.00, 'INR'),
(2, 'worldwide', 319000000.00, 'USD'),
(3, 'home_country', 200000000.00, 'INR'),
(4, 'home_country', 53000000.00, 'USD'),
(4, 'worldwide', 258000000.00, 'USD'),
(5, 'home_country', 176000000.00, 'USD'),
(7, 'worldwide', 98500000.00, 'USD');

-- 13. TITLE_GENRE
INSERT INTO title_genre (title_id, genre_id) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 1),
(11, 2),
(13, 2);

-- 14. TITLE_TAG
INSERT INTO title_tag (title_id, tag_id) VALUES
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(4, 5),
(6, 7),
(7, 8),
(9, 3),
(11, 5),
(19, 4);

-- 15. TITLE_PERSON
INSERT INTO title_person (title_id, person_id, role) VALUES
(1, 1, 'director'),
(1, 2, 'actor'),
(2, 3, 'director'),
(2, 4, 'actor'),
(3, 5, 'director'),
(4, 6, 'director'),
(4, 7, 'actor'),
(5, 8, 'director'),
(5, 9, 'actor'),
(16, 10, 'director');

-- 16. TITLE_STUDIO
INSERT INTO title_studio (title_id, studio_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 6),
(5, 5),
(6, 5),
(11, 4),
(12, 4),
(16, 4),
(20, 4);
