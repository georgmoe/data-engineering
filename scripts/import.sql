CREATE TYPE payment_method AS ENUM ('PayPal', 'Credit Card', 'Cash');
CREATE TYPE gender AS ENUM ('Female', 'Male');

CREATE TABLE orders (
    customer_id INT,
    purchase_date TIMESTAMP,
    product_category VARCHAR(30),
    product_price INT,
    quantity INT,
    total_purchase_amout INT,
    payment_method payment_method,
    customer_age INT,
    returned REAL,
    customer_name VARCHAR(60),
    age INT,
    gender gender,
    curn REAL
);

COPY orders FROM '/mockdata/ecommerce_customer_data_large.csv' WITH CSV HEADER;

ALTER TABLE orders
    ALTER returned TYPE BOOL 
        USING CASE WHEN returned > 0 THEN TRUE ELSE FALSE END;

ALTER TABLE orders
    ALTER curn TYPE BOOL 
        USING CASE WHEN curn > 0 THEN TRUE ELSE FALSE END;

ALTER TABLE orders
    ADD order_id INT PRIMARY KEY;