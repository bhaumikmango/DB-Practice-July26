-- 1. User 
CREATE TABLE "user" (
    user_id     SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE NOT NULL,
    phone       VARCHAR(20)
);

-- 2. Property
CREATE TABLE property (
    property_id   SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    description   TEXT,
    address       VARCHAR(255),
    status        VARCHAR(20) DEFAULT 'active'
);

-- 3. Accommodation Type 
CREATE TABLE accommodation_type (
    type_id         SERIAL PRIMARY KEY,
    category_label  VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Property + Accommodation Type
CREATE TABLE property_accommodation_type (
    property_accommodation_id  SERIAL PRIMARY KEY,
    property_id                INTEGER NOT NULL REFERENCES property(property_id) ON DELETE CASCADE,
    type_id                    INTEGER NOT NULL REFERENCES accommodation_type(type_id) ON DELETE RESTRICT,
    price_per_day               NUMERIC(10, 2) NOT NULL CHECK (price_per_day >= 0),
    quantity_available          INTEGER DEFAULT 1 CHECK (quantity_available >= 0),
    UNIQUE (property_id, type_id)
);

-- 5. Facility
CREATE TABLE facility (
    facility_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL UNIQUE
);

-- 6. Property <-> Facility 
CREATE TABLE property_facility (
    property_id  INTEGER NOT NULL REFERENCES property(property_id) ON DELETE CASCADE,
    facility_id  INTEGER NOT NULL REFERENCES facility(facility_id) ON DELETE CASCADE,
    PRIMARY KEY (property_id, facility_id)
);

-- 7. Entertainment
CREATE TABLE entertainment (
    entertainment_id  SERIAL PRIMARY KEY,
    name              VARCHAR(100) NOT NULL UNIQUE
);

-- 8. Property <-> Entertainment
CREATE TABLE property_entertainment (
    property_id       INTEGER NOT NULL REFERENCES property(property_id) ON DELETE CASCADE,
    entertainment_id  INTEGER NOT NULL REFERENCES entertainment(entertainment_id) ON DELETE CASCADE,
    PRIMARY KEY (property_id, entertainment_id)
);

-- 9. Booking
CREATE TABLE booking (
    booking_id                  SERIAL PRIMARY KEY,
    user_id                     INTEGER NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
    property_accommodation_id   INTEGER NOT NULL REFERENCES property_accommodation_type(property_accommodation_id) ON DELETE RESTRICT,
    status                      VARCHAR(20) DEFAULT 'pending',
    deposit_amount              NUMERIC(10, 2) CHECK (deposit_amount >= 0),
    duration_days               INTEGER CHECK (duration_days > 0),
    created_at                  TIMESTAMP DEFAULT NOW()
);
