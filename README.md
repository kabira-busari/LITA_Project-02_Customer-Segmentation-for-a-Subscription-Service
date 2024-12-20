# Customer Segmentation for a Subscription Service

## Table of Contents
- [Introduction](#introduction)
- [Google Sheet Analysis](#google-sheet-analysis)
- [SQL Queries Analysis](#sql-queries-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Analysis Insights](#analysis-insights)
- [Conclusion](#conclusion)

## Introduction
This project analyzes customer data for a subscription-based service, aiming to identify customer segments, subscription trends, and key drivers of cancellations and renewals. The project concludes with an interactive Power BI dashboard that presents these insights, providing actionable information to improve customer retention and revenue..

### 1.1 Project Objectives
- Identify key customer segments and their behaviors.
- Analyze subscription popularity and average duration.
- Track and analyze cancellation and renewal trends.
- Present insights via a Power BI dashboard for data-driven decision-making.

### 1.2 Tools Used
- **Google Sheets**: Initial data exploration and pivot tables for summary analysis.
- **SQL Server**: Extract and query insights for a deeper understanding of customer trends.
- **Power BI**: Interactive dashboard for visualizing customer segments and trends.

### 1.3 Dataset
The dataset includes:
- **Customer Details**: Unique identifiers, names, and regions.
- **Subscription Information**: Types, start and end dates, and cancellation status.
- **Revenue**: Transactional revenue data by customer.





---
## Google Sheet Analysis
### 1 Objective
The Excel analysis aims to uncover subscription patterns, including the popularity of each subscription type, revenue contributions, and average subscription durations by type and region.

### 2 Methodology
- Loaded and cleaned the data in Excel, removing duplicates and standardizing formatting.
- Created pivot tables to analyze customer segments, subscription duration, and revenue by region and subscription type.
- Visualized findings with bar, pie, and line charts.

### 3 Key Reports
#### 3.1 Subscription Types by Popularity

![Subscription Type by Popularity](https://github.com/kabira-busari/LITA_Project-02_Customer-Segmentation-for-a-Subscription-Service/blob/main/Subscription%20Types%20by%20Popularity%20Chart.png?raw=true)

This report highlights customer preferences for each subscription type:
- **Basic** subscription is the most popular, followed by **Premium** and **Standard**.
- Insights suggest focusing m arketing efforts on the Basic plan due to its high customer base.

#### 3.2 Revenue by Subscription Type

![Revenue by Subscription Type](https://github.com/kabira-busari/LITA_Project-02_Customer-Segmentation-for-a-Subscription-Service/blob/main/Revenue%20by%20Subscription%20Type%20Chart.png?raw=true)

This analysis shows the total revenue by subscription type:
- **Basic** subscriptions dominate with **$33.8 million** in revenue, indicating high popularity or volume.
- **Premium** and **Standard** each contribute around **$16.9 million**, suggesting similar revenue potential.
- Converting Basic subscribers to Premium or Standard could increase revenue per customer.

#### 3.3 Subscription Duration by Type

![Subscription Duration by Type](https://github.com/kabira-busari/LITA_Project-02_Customer-Segmentation-for-a-Subscription-Service/blob/main/Average%20Subscription%20Duration%20by%20Subscription%20Type%20Chart.png?raw=true)

This chart visualizes the average subscription duration by type:
- All types have a similar average duration of around 12 months.
- Improving retention for each type could enhance revenue consistency.

#### 3.4 Subscriptions by Region

![Subscriptions by Region](https://github.com/kabira-busari/LITA_Project-02_Customer-Segmentation-for-a-Subscription-Service/blob/main/Subscriptions%20by%20Region%20Chart.png?raw=true)

This report provides insights into regional demand:
- Subscriptions are evenly spread across regions, with a slight lead in the **East**.
- Focusing on high-performing regions while improving marketing in lower-performing regions (e.g., West) could improve overall growth.

### 4 Data Sources
[Download the Customer Data](https://docs.google.com/spreadsheets/d/1uX7hdUgaS2KxBFbtkl-cvrYSC24ZxpggIzeDtGaa34w/edit?usp=sharing)




---
## SQL Queries Analysis
### 1 Objective
SQL queries were used to further explore customer data, identifying regional trends, cancellation rates, and revenue patterns by subscription type.

### 2 Methodology
- Loaded data into PostgreSQL and validated for completeness.
- Executed SQL queries to identify key metrics: customer counts by region, top subscription types, and high-risk segments.
- Calculated totals for active vs. canceled subscriptions and average duration across all customers.

### 3 Key Reports
#### 3.1 Total Customers by Region
```
SELECT region, COUNT(DISTINCT customer_id) AS customers
FROM customer_data
GROUP BY region;
```
- Each region has an equal number of unique customers (5), indicating a balanced distribution across all regions.

#### 3.2 Most Popular Subscription Type
```
SELECT subscription_type, COUNT(DISTINCT customer_id) AS customers
FROM customer_data
GROUP BY subscription_type
ORDER BY customers DESC
LIMIT 1;
```
- **Basic** is the most popular subscription type with 10 unique customers, making it the most widely chosen plan among customers. 

#### 3.3 Cancellations within Six Months
```
SELECT DISTINCT customer_id, customer_name, subscription_type
FROM customer_data
WHERE canceled = TRUE
  AND EXTRACT(MONTH FROM AGE(subscription_end, subscription_start)) <= 6;
```
- Customers who canceled within 6 months are spread across **Basic**, **Premium**, and **Standard** plans, indicating that early cancellations are not isolated to a specific subscription type.
  
#### 3.4 Average Subscription Duration
```
SELECT AVG(
    EXTRACT(YEAR FROM AGE(subscription_end, subscription_start)) * 12 +
    EXTRACT(MONTH FROM AGE(subscription_end, subscription_start))) 
	AS AvgSubscriptionDuration
FROM customer_data;
```
- On average, customers maintain their subscription for 12 months (or 1 year).

#### 3.5 Subscriptions Longer Than 12 Months
```
SELECT customer_id, customer_name, subscription_type
FROM customer_data
WHERE 
    EXTRACT(YEAR FROM AGE(subscription_end, subscription_start)) * 12 +
    EXTRACT(MONTH FROM AGE(subscription_end, subscription_start)) > 12;
```
- The analysis found that all customers have subscriptions of 12 months or less. No subscriptions exceed a one-year duration.
- This suggests a standard annual or shorter subscription model in use.

#### 3.6 Revenue by Subscription Type
```
SELECT subscription_type, SUM(revenue) AS total_revenue
FROM customer_data
GROUP BY subscription_type;
```
- **Basic** subscriptions have generated the highest revenue at **33,776,735**.
- **Premium** and **Standard** subscriptions are relatively close in total revenue, with around **16.8** million each.

#### 3.7 Top Regions for Cancellations
```
SELECT region, COUNT(DISTINCT customer_id) AS cancellations
FROM customer_data
WHERE cancelled = TRUE
GROUP BY region
ORDER BY cancellations DESC
LIMIT 3;
```
- The **North**, **South**, and **West** regions all tied for the top spot with 3 unique cancellations each.
- This indicates that there are 3 unique customers in each of these regions who have canceled their subscription, based on the available data.

#### 3.8 Active and Canceled Subscriptions
```
SELECT cancelled, COUNT(DISTINCT customer_id) AS subscription_count
FROM customer_data
GROUP BY cancelled;
```
- Active Subscriptions (cancelled = false): There are 11 unique customers with active subscriptions.
- Canceled Subscriptions (cancelled = true): There are 9 unique customers who have canceled their subscriptions.

### 4 SQL Scripts
[View SQL Scripts](LITA_Customer_Database_PostgreSQL.sql)




---
## Power BI Dashboard
### 1 Objectives
Build an interactive dashboard to enable stakeholders to explore key metrics, customer segments, and trends interactively.

### 2 Methodology
- Data was imported from SQL Server and Excel into Power BI.
- Cleaned and transformed data using Power Query.
- Created visuals for subscription patterns, customer segments, and revenue.

### 3 Dashboard Design
- Bar Chart for subscription type popularity.
- Column Chart for revenue by subscription type.
- Doughnut Chart for active vs. canceled subscriptions.
- Pie Chart for subscriptions by region.




---
## Analysis Insights
#### 1. Subscription Type Preferences
- The Basic plan has the most subscribers and generates the most revenue, making it a key focus for the business.
- Upgrading Basic subscribers to Premium or Standard plans could increase revenue.

#### 2. Regional Demand:
- The East region has a slightly higher demand for subscriptions, so it’s worth focusing more marketing efforts there.
- Since cancellations are similar across regions, it might help to look at ways to keep customers engaged in all areas.

#### 3. Subscription Length:
- On average, subscriptions are kept for about 12 months.
- Some customers cancel within six months, so it may be helpful to improve the customer experience early on.

#### 4. Revenue by Plan:
- Basic plans bring in the highest revenue, with Premium and Standard plans close behind.
- Retention is Key. Focusing on keeping customers on any plan longer would help maintain steady revenue.

#### 5. Active vs. Canceled Subscriptions:
- There's high Cancellation Rate. Nearly half of customers cancel their subscriptions, so there’s room to improve retention and keep more customers active.




---
## Recommendations
- Focus on the Basic plan, as it’s the most popular. Keeping these subscribers engaged and offering upgrades to higher plans can increase revenue. 
- Improving the customer experience early on will help reduce cancellations and keep customers longer. 
- It’s also a good idea to invest in marketing in high-demand areas like the East region, while working to reduce cancellations across all regions.

These steps can help the subscription service grow by retaining more customers and increasing revenue.


