# Customer Segmentation for a Subscription Service

## Table of Contents
- [Introduction](#introduction)
- [Google Sheet Analysis](#google-sheet-analysis)
- [SQL Queries Analysis](#sql-queries-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Insights & Findings](#insights--findings)
- [Conclusion](#conclusion)

## Introduction
This project analyzes customer data for a subscription-based service, aiming to identify customer segments, subscription trends, and key drivers of cancellations and renewals. The project concludes with an interactive Power BI dashboard that presents these insights, providing actionable information to improve customer retention and revenue..

### 1.1 Project Objectives
- Identify key customer segments and their behaviors.
- Analyze subscription popularity and average duration.
- Track and analyze cancellation and renewal trends.
- Present insights via a Power BI dashboard for data-driven decision-making.

### 1.2 Tools Used
- Excel: Initial data exploration and pivot tables for summary analysis.
- SQL Server: Extract and query insights for a deeper understanding of customer trends.
- Power BI: Interactive dashboard for visualizing customer segments and trends.

### 1.3 Dataset
The dataset includes:
- Customer Details: Unique identifiers, names, and regions.
- Subscription Information: Types, start and end dates, and cancellation status.
- Revenue: Transactional revenue data by customer.





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

![Subscription Type by Popularity](https://github.com/kabira-busari/LITA_Project-02_Customer-Segmentation-for-a-Subscription-Service/blob/main/1.png?raw=true)

This report highlights customer preferences for each subscription type:
- Basic subscription is the most popular, followed by Premium and Standard.
- Insights suggest focusing marketing efforts on the Basic plan due to its high customer base.

#### 3.2 Revenue by Subscription Type

![Revenue by Subscription Type]()

This analysis shows the total revenue by subscription type:
- Basic and Premium subscriptions drive the highest revenue.
- Despite Basic's popularity, Premium generates substantial revenue, indicating a potential area for upselling.

#### 3.3 Subscription Duration by Type

![Subscription Duration by Type]()

This chart visualizes the average subscription duration by type:
- All types have a similar average duration of around 12 months.
- Improving retention for each type could enhance revenue consistency.

#### 3.4 Subscriptions by Region

![Subscriptions by Region]()

This report provides insights into regional demand:
- The South region has the highest subscription count.
- Focusing on high-performing regions while improving marketing in lower-performing regions (e.g., West) could improve overall growth.

### 4 Data Sources
Download the Customer Data




---
## SQL Queries Analysis
### 1 Objective
SQL queries were used to further explore customer data, identifying regional trends, cancellation rates, and revenue patterns by subscription type.

### 2 Methodology
- Loaded data into SQL Server and validated for completeness.
- Executed SQL queries to identify key metrics: customer counts by region, top subscription types, and high-risk segments.
- Calculated totals for active vs. canceled subscriptions and average duration across all customers.

### 3 Key Reports
#### 3.1 Total Customers by Region
```
SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM CustomerData
GROUP BY Region;
```
- South has the highest customer count, suggesting it as a key focus region.

#### 3.2 Most Popular Subscription Type
```
SELECT SubscriptionType, COUNT(CustomerID) AS CustomerCount
FROM CustomerData
GROUP BY SubscriptionType
ORDER BY CustomerCount DESC;
```
- Basic is the most popular subscription type by customer count.

#### 3.3 Cancellations within Six Months
```
SELECT CustomerID, SubscriptionType, Region
FROM CustomerData
WHERE Canceled = 1 AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;
```
- Insights from this query could inform retention efforts for high-risk segments.
  
#### 3.4 Average Subscription Duration
```
SELECT AVG(DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd)) AS AvgSubscriptionDuration
FROM CustomerData;
```
- Average subscription duration is approximately 12 months.

#### 3.5 Top Regions for Cancellations
```
SELECT Region, COUNT(CustomerID) AS Cancellations
FROM CustomerData
WHERE Canceled = 1
GROUP BY Region
ORDER BY Cancellations DESC
LIMIT 3;
```
- South has the highest cancellations, indicating potential for improved retention strategies.

### 4 SQL Scripts
View SQL Scripts




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
## Insights & Findings
#### 1. Subscription Type Preferences
Basic subscription has the most customers but moderate revenue; Premium is highly profitable and could benefit from targeted upselling.
#### 2. Regional Performance
South leads in both customer count and cancellations, indicating a need for targeted retention strategies.
#### 3. Customer Duration
The average duration of approximately 12 months indicates a stable customer base with opportunities for improving retention.
#### 4. Active vs. Canceled Subscriptions
Active customers constitute a majority; however, early cancellation rates warrant attention to improve customer lifecycle.




---
## Conclusion
- Subscription Strategy: Prioritize the Basic plan due to its high popularity, but consider upselling opportunities for Premium.
- Regional Focus: Improve customer experience and retention in the South, while boosting marketing efforts in underperforming regions.
- Retention Improvement: Develop strategies to extend customer lifecycle beyond the 12-month average, focusing on high-risk segments.

These insights support actionable strategies for growth, retention, and customer experience improvements.


