-- ACCOUNT table
CREATE TABLE ACCOUNT (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(10),
    role VARCHAR(255),
    status VARCHAR(20),
    has_warehouse BOOLEAN,
    address TEXT,
    safety_inspection_img VARCHAR(255),
    phone VARCHAR(20),
    position VARCHAR(255),
    has_shelf BOOLEAN,
    has_supply BOOLEAN,
    has_audit BOOLEAN,
    has_statistic BOOLEAN
);

-- WAREHOUSE_INVOICE table
CREATE TABLE WAREHOUSE_INVOICE (
    id SERIAL PRIMARY KEY,
    staff_id INTEGER REFERENCES ACCOUNT(id),
    receiving_time TIMESTAMP,
    supply_code VARCHAR(50),
    delivery_person_name VARCHAR(255),
    receiving_clerk_name VARCHAR(255),
    delivery_signature BYTEA,
    receiving_signature BYTEA,
    note TEXT
);

-- CATEGORY table
CREATE TABLE CATEGORY (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- PRODUCT table
CREATE TABLE PRODUCT (
    id SERIAL PRIMARY KEY,
    invoice_id INTEGER REFERENCES WAREHOUSE_INVOICE(id),
    provider_id INTEGER REFERENCES PROVIDER(id),
    category_id INTEGER REFERENCES CATEGORY(category_id),
    product_code VARCHAR(50),
    batch_code VARCHAR(50),
    input_price DECIMAL(10, 2),
    input_quantity INTEGER,
    sold_quantity INTEGER,
    shelf_qnt INTEGER,
    shelf_arrange_qnt INTEGER,
    is_disable BOOLEAN,
    disable_date DATE,
    expired_date DATE,
    manufacture_date DATE
);

-- PROVIDER table
CREATE TABLE PROVIDER (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    contact_person VARCHAR(255),
    phone_contact VARCHAR(20),
    email_contact VARCHAR(255),
    note TEXT
);

-- SHELF table
CREATE TABLE SHELF (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES CATEGORY(category_id),
    shelf_code VARCHAR(50)
);

-- COMPARTMENT table
CREATE TABLE COMPARTMENT (
    id SERIAL PRIMARY KEY,
    tier_id INTEGER REFERENCES TIER(id),
    product_id INTEGER REFERENCES PRODUCT(id),
    compartment_code VARCHAR(50),
    current_quantity INTEGER
);

-- INVENTORY table
CREATE TABLE INVENTORY (
    inventory_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES PRODUCT(id),
    create_by_staff INTEGER REFERENCES ACCOUNT(id),
    inventory_qnt INTEGER,
    product_status VARCHAR(20),
    staff_signature BYTEA,
    note TEXT
);

-- TIER table
CREATE TABLE TIER (
    id SERIAL PRIMARY KEY,
    shelf_id INTEGER REFERENCES SHELF(id),
    tier_code VARCHAR(50)
);
