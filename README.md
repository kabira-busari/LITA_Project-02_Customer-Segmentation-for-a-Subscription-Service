# Customer Segmentation for a Subscription Service

### 1.1 Introduction
This project analyzes customer data for a subscription service to identify key segments and trends, including customer behaviors, subscription types, and insights into cancellations and renewals.

The analysis was completed in three steps:
- Excel: I explored customer subscription data using pivot tables to identify patterns, calculate subscription duration averages, and determine popular subscription types.
- SQL: I used SQL queries to delve deeper into the data, answering key business questions related to customer retention, revenue, and regional segmentation.
- Power BI: Finally, I developed an interactive Power BI dashboard to visualize customer segmentation, cancellations, and subscription trends.

### 1.2 Tools
- Excel: Conducted data exploration with pivot tables to understand subscription patterns and key customer segments.
- SQL (PostgreSQL): Wrote queries to answer specific questions about customer segments, including average subscription durations and revenue by subscription type.
- Power BI: Created an interactive dashboard to visualize key metrics and segment trends.
- Dataset: Customer subscription dataset containing information on customer demographics, subscription types, revenue, and subscription status.

### 1.3 Dataset
The data used in this project includes details on customers' demographics, subscription types, start dates, cancellation dates, and revenue. You can download the dataset here:
Download Customer Data




---
## Excel Analysis
### 2.1 Objective
The Excel analysis aimed to explore key subscription trends and customer segments using pivot tables, charts, and summary metrics.

### 2.2 Methodology
- Imported the customer dataset into Excel, ensuring all necessary columns were included.
- Created pivot tables to summarize subscription counts by type and region.
- Calculated average subscription duration by subscription type to understand retention patterns.
- Visualized key metrics, such as the distribution of subscription types and average revenue, using charts.

### 2.3 Key Reports
#### 2.3.1 Subscription Types and Average Duration
Created a pivot table to analyze the popularity of different subscription types and calculate the average subscription duration for each type.

#### 2.3.2 Regional Customer Counts
Generated a report showing customer distribution by region, helping to identify regions with high customer counts.

#### 2.3.3 Cancellations and Renewals by Month
Developed a monthly trend analysis for subscription renewals and cancellations to understand retention rates over time.




---
## SQL Analysis
### 3.1 Objective
SQL queries were used to answer targeted business questions, providing deeper insights into subscription metrics, cancellations, and revenue.

### 3.2 Methodology
- Loaded the dataset into PostgreSQL to query customer data.
- Created SQL queries to calculate the total customer count, popular subscription types, average duration, and revenue metrics.

### 3.3 Key SQL Queries
#### 3.3.1 Total Customers by Region
```
SELECT region, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY region;
```
This query provides the customer count for each region, helping us understand customer distribution.

#### 3.3.2 Most Popular Subscription Type
```
SELECT subscription_type, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY subscription_type
ORDER BY total_customers DESC
LIMIT 1;
```
Identifies the most popular subscription type by customer count.

#### 3.3.3 Customers Who Canceled Within 6 Months
```
SELECT customer_id, subscription_type, subscription_duration
FROM customers
WHERE subscription_status = 'Canceled' 
AND subscription_duration <= 6;
```
Finds customers who canceled their subscriptions within 6 months, indicating potential churn risks.

#### 3.3.4 Average Subscription Duration
```
SELECT AVG(subscription_duration) AS average_duration
FROM customers;
```
Calculates the average subscription duration across all customers.

#### 3.3.5 Total Revenue by Subscription Type
```
SELECT subscription_type, SUM(revenue) AS total_revenue
FROM customers
GROUP BY subscription_type;
```
Displays total revenue for each subscription type.

#### 3.3.6 Top 3 Regions by Cancellations
```
SELECT region, COUNT(customer_id) AS cancellations
FROM customers
WHERE subscription_status = 'Canceled'
GROUP BY region
ORDER BY cancellations DESC
LIMIT 3;
```
Identifies the top 3 regions with the highest number of cancellations.

### 3.4 SQL Scripts
View SQL Scripts




---
## Power BI Dashboard Report
### 4.1 Objective
Using Power BI, I analyzed and visualized the subscription service’s customer data. Key metrics covered include subscription trends, cancellations, and revenue by subscription type.

### 4.2 Dashboard Methodology
- Data Import: The dataset was imported from Excel and PostgreSQL into Power BI.
- Data Transformation: The data was cleaned and structured using Power Query Editor by filtering out unnecessary columns, aggregating revenue by subscription type and region, and creating calculated metrics such as average subscription duration.
- Visualization Design:
Line Chart for monthly cancellations and renewals.
Column Chart for revenue by subscription type.
Map for customer distribution by region.
Bar Chart for average subscription duration by type.

### 4.3 Dashboard Layout
- Key Metrics: Total subscriptions, active vs. canceled subscriptions.
- Subscription Patterns: Revenue and average duration by subscription type.
- Cancellations and Regional Insights: Cancellations by month and customer distribution across regions.

📊 View the Interactive Power BI Dashboard

4.4 Conclusion
The Power BI dashboard provides a comprehensive view of customer segments, revealing subscription trends, key regions, and customer behaviors. By identifying top subscription types, regions with high customer counts, and analyzing cancellations, the service can better target customer retention and tailor marketing efforts.

This concise format allows you to document your entire project without overwhelming the reader, focusing on insights and linking to key resources. Let me know if you’d like any further adjustments!
