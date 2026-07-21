USE olist_analysis;


-- SET GLOBAL local_infile = ON; to enable Allow Load Data Local Infile because in newer versions of mySQL you have to do it manually
SHOW VARIABLES LIKE 'local_infile';
SELECT USER(), CURRENT_USER();

-- SHOW GLOBAL VARIABLES LIKE 'local_infile';


-- creates customer table
CREATE TABLE customer_cleaned(
customer_id VARCHAR(50),
customer_unique_id VARCHAR(50),
customer_zip_code_prefix INT, 
customer_city VARCHAR(50), 
customer_state VARCHAR(50)
);

-- creates location table
CREATE TABLE location_cleaned(
geolocation_zip_code_prefix varchar(50), 
geolocation_lat int, 
geolocation_lng int, 
geolocation_city varchar(50), 
geolocation_state varchar(50)
);

-- creates order_items table
CREATE TABLE order_items(
order_id VARCHAR(50),
order_item_id INT,
product_id VARCHAR(50),
seller_id VARCHAR(50),
price DECIMAL(10,2),
freight_value DECIMAL(10,2),
shipping_limit_datetime DATETIME
);

-- creates order table
CREATE TABLE Orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE payments(
order_id VARCHAR(50),                
payment_sequential INT,
payment_type VARCHAR(50),    
payment_installments INT,
payment_value DECIMAL(10,2),
Overall_spent DECIMAL(10,2)
);

CREATE TABLE reviews(
review_id VARCHAR(50),                            
order_id VARCHAR(50),                             
review_score INT,                       
review_comment_title VARCHAR(50),                 
review_comment_message VARCHAR(50),               
review_creation_date DATETIME,      
review_answer_timestamp DATETIME
);

CREATE TABLE products(
product_id VARCHAR(50),
product_category_name VARCHAR(50),
product_name_lenght DECIMAL,
product_description_lenght DECIMAL,
product_photos_qty DECIMAL,
product_weight_g DECIMAL,
product_length_cm DECIMAL,
product_height_cm DECIMAL,
product_width_cm DECIMAL
);

CREATE TABLE sellers(
seller_id VARCHAR(50),
seller_zip_code_prefix INT,
seller_city VARCHAR(50),
seller_state VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/customer.csv'
INTO TABLE customer_cleaned
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/location.csv'
INTO TABLE location_cleaned
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/order.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/reviews.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/sellers.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/dipoa/Desktop/DATASETS/Brazilian E-Commerce Public Dataset by Olist/New folder/CLEANED OLIST/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ADDING PRIMARY KEYS
ALTER TABLE customer_cleaned
ADD PRIMARY KEY(customer_id);

ALTER TABLE orders
ADD PRIMARY KEY(order_id);

ALTER TABLE products
ADD PRIMARY KEY(product_id);

ALTER TABLE sellers
ADD PRIMARY KEY(seller_id);

ALTER TABLE reviews
ADD PRIMARY KEY(review_id);

ALTER TABLE payments
ADD PRIMARY KEY(order_id, payment_sequential);

ALTER TABLE order_items
ADD PRIMARY KEY(order_id, order_item_id);


-- (Error Code: 1292. Incorrect datetime value: '0000-00-00 00:00:00' for column 'order_purchase_timestamp' at row 1) this means the date values has to be null instead of zeros


ALTER TABLE orders
MODIFY order_purchase_timestamp VARCHAR(30),
MODIFY order_approved_at VARCHAR(30),
MODIFY order_delivered_carrier_date VARCHAR(30),
MODIFY order_delivered_customer_date VARCHAR(30),
MODIFY order_estimated_delivery_date VARCHAR(30);



-- replacing the zeros with null
UPDATE orders
SET
    order_purchase_timestamp =
        NULLIF(order_purchase_timestamp, '0000-00-00 00:00:00'),

    order_approved_at =
        NULLIF(order_approved_at, '0000-00-00 00:00:00'),

    order_delivered_carrier_date =
        NULLIF(order_delivered_carrier_date, '0000-00-00 00:00:00'),

    order_delivered_customer_date =
        NULLIF(order_delivered_customer_date, '0000-00-00 00:00:00'),

    order_estimated_delivery_date =
        NULLIF(order_estimated_delivery_date, '0000-00-00 00:00:00');
        
SELECT *
FROM orders
WHERE
    order_purchase_timestamp = '0000-00-00 00:00:00'
    OR order_approved_at = '0000-00-00 00:00:00'
    OR order_delivered_carrier_date = '0000-00-00 00:00:00'
    OR order_delivered_customer_date = '0000-00-00 00:00:00'
    OR order_estimated_delivery_date = '0000-00-00 00:00:00';
    
-- coverting back to datetime 
ALTER TABLE orders
MODIFY order_purchase_timestamp DATETIME NULL,
MODIFY order_approved_at DATETIME NULL,
MODIFY order_delivered_carrier_date DATETIME NULL,
MODIFY order_delivered_customer_date DATETIME NULL,
MODIFY order_estimated_delivery_date DATETIME NULL;


-- adding foreign keys
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY(customer_id)
REFERENCES customer_cleaned(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY(product_id)
REFERENCES products(product_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_seller
FOREIGN KEY(seller_id)
REFERENCES sellers(seller_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payment_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

-- Now that i have my primary and foreign keys i can create an ERD