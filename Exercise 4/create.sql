CREATE TYPE growth_habit_enum AS ENUM ('ANNUAL', 'BIENNIAL', 'PERENNIAL');

CREATE TABLE plant (
    plant_id        SERIAL PRIMARY KEY,
    scientific_name VARCHAR(150) NOT NULL,
    common_name     VARCHAR(150) NOT NULL,
    family          VARCHAR(100),
    genus           VARCHAR(100),
    species         VARCHAR(100),
    growth_habit    growth_habit_enum,
    CONSTRAINT uq_plant_scientific_name UNIQUE (scientific_name)
);

CREATE TABLE greenhouse (
    greenhouse_id SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    location      VARCHAR(255)
);

CREATE TABLE substrate_type (
    substrate_type_id SERIAL PRIMARY KEY,
    type_name          VARCHAR(100) NOT NULL,
    description        TEXT,
    CONSTRAINT uq_substrate_type_name UNIQUE (type_name)
);

CREATE TABLE fertilizer (
    fertilizer_id SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    npk_ratio     VARCHAR(50),
    manufacturer  VARCHAR(150)
);

CREATE TABLE tray (
    tray_id           SERIAL PRIMARY KEY,
    greenhouse_id     INTEGER NOT NULL
                      REFERENCES greenhouse (greenhouse_id)
                      ON DELETE RESTRICT,
    substrate_type_id INTEGER NOT NULL
                      REFERENCES substrate_type (substrate_type_id)
                      ON DELETE RESTRICT,
    soil_ph           DECIMAL(3, 2) NOT NULL,
    planting_date     DATE NOT NULL,
    is_control        BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT chk_tray_soil_ph CHECK (soil_ph >= 0.00 AND soil_ph <= 14.00)
);

CREATE INDEX idx_tray_greenhouse_id ON tray (greenhouse_id);
CREATE INDEX idx_tray_substrate_type_id ON tray (substrate_type_id);
CREATE TYPE temperature_unit_enum AS ENUM ('C', 'F');
CREATE TYPE luminosity_unit_enum AS ENUM ('LUX', 'PPFD');

CREATE TABLE environment_reading (
    reading_id        SERIAL PRIMARY KEY,
    greenhouse_id     INTEGER NOT NULL
                      REFERENCES greenhouse (greenhouse_id)
                      ON DELETE CASCADE,
    temperature       DECIMAL(5, 2) NOT NULL,
    temperature_unit  temperature_unit_enum NOT NULL,
    luminosity        DECIMAL(10, 2) NOT NULL,
    luminosity_unit   luminosity_unit_enum NOT NULL,
    humidity          DECIMAL(5, 2) NOT NULL,
    co2_level         DECIMAL(10, 2) NOT NULL,
    sensor_id         VARCHAR(100) NOT NULL,
    reading_timestamp TIMESTAMP NOT NULL,
    CONSTRAINT chk_env_humidity CHECK (humidity >= 0.00 AND humidity <= 100.00)
);

CREATE INDEX idx_environment_reading_greenhouse_id ON environment_reading (greenhouse_id);
CREATE INDEX idx_environment_reading_timestamp ON environment_reading (reading_timestamp);

CREATE TABLE fertilizer_application (
    application_id SERIAL PRIMARY KEY,
    tray_id        INTEGER NOT NULL
                   REFERENCES tray (tray_id)
                   ON DELETE CASCADE,
    fertilizer_id  INTEGER NOT NULL
                   REFERENCES fertilizer (fertilizer_id)
                   ON DELETE RESTRICT,
    dilution_ratio VARCHAR(50) NOT NULL,
    date_applied   DATE NOT NULL
);

CREATE INDEX idx_fertilizer_application_tray_id ON fertilizer_application (tray_id);
CREATE INDEX idx_fertilizer_application_fertilizer_id ON fertilizer_application (fertilizer_id);

CREATE TABLE plant_group (
    plant_group_id SERIAL PRIMARY KEY,
    tray_id        INTEGER NOT NULL
                   REFERENCES tray (tray_id)
                   ON DELETE CASCADE,
    plant_id       INTEGER NOT NULL
                   REFERENCES plant (plant_id)
                   ON DELETE RESTRICT,
    quantity       INTEGER NOT NULL,
    CONSTRAINT chk_plant_group_quantity CHECK (quantity > 0)
);

CREATE INDEX idx_plant_group_tray_id ON plant_group (tray_id);
CREATE INDEX idx_plant_group_plant_id ON plant_group (plant_id);
CREATE TYPE result_category_enum AS ENUM ('SUCCESS', 'FAILURE', 'INCONCLUSIVE');

CREATE TABLE tray_conclusion (
    conclusion_id   SERIAL PRIMARY KEY,
    tray_id         INTEGER NOT NULL
                    REFERENCES tray (tray_id)
                    ON DELETE CASCADE,
    date_recorded   DATE NOT NULL,
    result_category result_category_enum NOT NULL,
    summary_notes   TEXT NOT NULL,
    CONSTRAINT uq_tray_conclusion_tray_id UNIQUE (tray_id)
);

CREATE INDEX idx_tray_conclusion_tray_id ON tray_conclusion (tray_id);

CREATE TABLE growth_observation (
    observation_id   SERIAL PRIMARY KEY,
    plant_group_id   INTEGER NOT NULL
                     REFERENCES plant_group (plant_group_id)
                     ON DELETE CASCADE,
    observation_date DATE NOT NULL,
    height            DECIMAL(6, 2) NOT NULL,
    health_rating     INTEGER NOT NULL,
    comment           TEXT,
    CONSTRAINT chk_growth_observation_health_rating
        CHECK (health_rating >= 1 AND health_rating <= 5),
    CONSTRAINT chk_growth_observation_height
        CHECK (height >= 0.00),
    CONSTRAINT uq_growth_observation_group_date
        UNIQUE (plant_group_id, observation_date)
);

CREATE INDEX idx_growth_observation_plant_group_id ON growth_observation (plant_group_id);
CREATE INDEX idx_growth_observation_date ON growth_observation (observation_date);
