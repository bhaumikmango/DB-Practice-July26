-- USERS
CREATE TABLE users (
    user_id       SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTIES
CREATE TABLE properties (
    property_id       SERIAL PRIMARY KEY,
    title             VARCHAR(100) NOT NULL,   
    town              VARCHAR(100),
    description       TEXT NOT NULL,
    property_type     VARCHAR(20) NOT NULL DEFAULT 'house'
                      CHECK (property_type IN ('house','flat','room','studio')),
    property_area_sqft     DECIMAL(8,2),            
    carpet_area_sqft       DECIMAL(8,2),            
    bedrooms          SMALLINT,
    price             DECIMAL(8,2) NOT NULL,
    price_period      VARCHAR(10) NOT NULL DEFAULT 'monthly'
                      CHECK (price_period IN ('weekly','monthly')),
    age_of_property_yrs   SMALLINT,                
    status            VARCHAR(20) NOT NULL DEFAULT 'to_let'
                      CHECK (status IN ('to_let','let_agreed','under_offer')),
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTY_IMAGES
CREATE TABLE property_images (
    image_id      SERIAL PRIMARY KEY,
    property_id   INT NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
    image_url     VARCHAR(255) NOT NULL,
    image_type    VARCHAR(10) NOT NULL DEFAULT 'other'
                  CHECK (image_type IN ('primary','other')),
    display_order SMALLINT NOT NULL DEFAULT 0
);

-- SAVED_PROPERTIES
CREATE TABLE saved_properties (
    saved_prop_id            SERIAL PRIMARY KEY,
    user_id                  INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    property_id              INT NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
    saved_at                 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    price_at_time_of_saving  DECIMAL(8,2) NOT NULL,
    UNIQUE (user_id, property_id)
);
