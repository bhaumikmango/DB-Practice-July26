CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  city VARCHAR(50),
  country VARCHAR(50),
  signup_date DATE
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(50),
  price NUMERIC(10,2),
  stock_quantity INT
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  product_id INT REFERENCES products(id),
  quantity INT,
  order_date TIMESTAMP DEFAULT NOW(),
  status VARCHAR(20)
);
