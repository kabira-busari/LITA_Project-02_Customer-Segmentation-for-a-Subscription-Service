-- Create a table named sales_data to store sales information
CREATE TABLE customer_data (
    customer_id INT,				-- Unique identifier for each customer.					
    customer_name VARCHAR(50),			-- Name of the customer.	
    region VARCHAR(20),				 -- Geographic region of the customer.
    subscription_type VARCHAR(20),		-- Type of subscription (e.g., Basic, Premium, Standard).
    subscription_start DATE,			-- Start date of the subscription.
    subscription_end DATE,			-- End date of the subscription.
    cancelled BOOLEAN,				-- Boolean indicating if the subscription was canceled.
    revenue NUMERIC(10, 2)			-- Revenue generated from each subscription.
);

-- Import data from a CSV file into the customer_data table
COPY customer_data (customer_id, customer_name, region, subscription_type, subscription_start, subscription_end, cancelled, revenue)
FROM 'C:\tmp\LITA_Capstone_Dataset - CustomerData.csv'
DELIMITER ','
CSV HEADER;

-- Select the first 10 records from the sales_data table
SELECT * 
FROM customer_data 
LIMIT 10;

-- Total Number of Customers from Each Region
SELECT region, COUNT(DISTINCT customer_id) AS customers
FROM customer_data
GROUP BY region;

-- Most Popular Subscription Type by Number of Customers
SELECT subscription_type, COUNT(DISTINCT customer_id) AS customers
FROM customer_data
GROUP BY subscription_type
ORDER BY customers DESC
LIMIT 1;

-- Customers Who Canceled Their Subscription Within 6 Months
SELECT DISTINCT customer_id, customer_name, subscription_type
FROM customer_data
WHERE cancelled = TRUE
  AND EXTRACT(MONTH FROM AGE(subscription_end, subscription_start)) <= 6;

-- Average Subscription Duration for All Customers
SELECT AVG(
    EXTRACT(YEAR FROM AGE(subscription_end, subscription_start)) * 12 +
    EXTRACT(MONTH FROM AGE(subscription_end, subscription_start)))
	AS AvgSubscriptionDuration
FROM customer_data;

-- Customers with Subscriptions Longer Than 12 Months
SELECT customer_id, customer_name, subscription_type
FROM customer_data
WHERE 
    EXTRACT(YEAR FROM AGE(subscription_end, subscription_start)) * 12 +
    EXTRACT(MONTH FROM AGE(subscription_end, subscription_start)) > 12;

-- Total Revenue by Subscription Type
SELECT subscription_type, SUM(revenue) AS total_revenue
FROM customer_data
GROUP BY subscription_type;

-- Top 3 Regions by Subscription Cancellations
SELECT region, COUNT(DISTINCT customer_id) AS cancellations
FROM customer_data
WHERE cancelled = TRUE
GROUP BY region
ORDER BY cancellations DESC
LIMIT 3;

-- Total Number of Active and Canceled Subscriptions
SELECT cancelled, COUNT(DISTINCT customer_id) AS subscription_count
FROM customer_data
GROUP BY cancelled;




