CREATE TABLE country(
id SERIAL PRIMARY KEY,
country_name VARCHAR(100),
currency_code VARCHAR(3)
);

CREATE TABLE platform(
id SERIAL PRIMARY KEY,
platform_name VARCHAR(50)
);

CREATE TABLE genre(
id SERIAL PRIMARY KEY,
category_name VARCHAR(50)
);

CREATE TABLE tag(
id SERIAL PRIMARY KEY,
tag_name VARCHAR(50)
);

CREATE TABLE person(
id SERIAL PRIMARY KEY,
name VARCHAR(150)
);

CREATE TABLE studio(
id SERIAL PRIMARY KEY,
studio_name VARCHAR(150)
);

CREATE TABLE title(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
release_year INT,
type VARCHAR(10),
country_id INT REFERENCES country(id)
);

CREATE TABLE movie(
title_id INT PRIMARY KEY REFERENCES title(id),
runtime_minutes INT
);

CREATE TABLE series(
title_id INT PRIMARY KEY REFERENCES title(id),
status VARCHAR(20)
);

CREATE TABLE watch_event(
id SERIAL PRIMARY KEY,
title_id INT REFERENCES title(id),
date_watched DATE,
rewatch_count INT,
platform_id INT REFERENCES platform(id)
);

CREATE TABLE review(
id SERIAL PRIMARY KEY,
title_id INT REFERENCES title(id),
rating_scale INT,
comments VARCHAR(400)
);

CREATE TABLE box_office_collection(
id SERIAL PRIMARY KEY,
title_id INT REFERENCES title(id),
region VARCHAR(20),
amount NUMERIC(18,2),
currency_code VARCHAR(3)
);

CREATE TABLE title_genre(
title_id INT,
genre_id INT,
CONSTRAINT tg_id PRIMARY KEY (title_id, genre_id),
FOREIGN KEY (title_id) REFERENCES title(id),
FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE title_tag(
title_id INT,
tag_id INT,
CONSTRAINT tt_id PRIMARY KEY (title_id, tag_id),
FOREIGN KEY (title_id) REFERENCES title(id),
FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE title_person(
title_id INT,
person_id INT,
role VARCHAR(10),
CONSTRAINT tp_id PRIMARY KEY (title_id, person_id, role),
FOREIGN KEY (title_id) REFERENCES title(id),
FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE title_studio(
title_id INT,
studio_id INT,
CONSTRAINT ts_id PRIMARY KEY (title_id, studio_id),
FOREIGN KEY (title_id) REFERENCES title(id),
FOREIGN KEY (studio_id) REFERENCES studio(id)
);
