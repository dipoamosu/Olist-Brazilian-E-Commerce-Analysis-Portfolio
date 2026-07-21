
# Peter Oladipupo Amosu's Portfolio

# [Brazilian E-Commerce Customer Satisfaction Prediction & Business Intelligence Dashboard](https://github.com/dipoamosu/Olist-Brazilian-E-Commerce-Analysis-Portfolio)

## Project Overview

This project is an end-to-end Data Analytics and Machine Learning portfolio built using the Brazilian E-Commerce Public Dataset by Olist.
The objective was to transform raw e-commerce data into meaningful business insights while developing a machine learning model capable of predicting customer satisfaction.
The project demonstrates the complete analytics workflow, including:
- SQL Data Analysis
- Python Data Cleaning & Feature Engineering
- Machine Learning
- Interactive Power BI Dashboard
- Business Intelligence Reporting

---

# Dashboard Preview
### Executive Summary Dashboard

<img width="1915" height="1030" alt="CUSTOMER SATISFACTION PREDICTION DASHBOARD " src="https://github.com/user-attachments/assets/aeb9d962-8e70-4439-8965-1db754a3e746" />


### AI Prediction Dashboard

<img width="1916" height="1031" alt="AI CUSTOMER SATISFACTION PREDICTIONS" src="https://github.com/user-attachments/assets/5cad3b89-a789-4c39-add3-7ba9d2c4e84b" />


---

# Business Problem

Customer satisfaction is one of the most important metrics for e-commerce businesses.
Poor customer experiences can lead to:
- Reduced customer retention
- Negative reviews
- Increased refund requests
- Lower revenue

This project aims to help decision-makers identify patterns affecting customer satisfaction and predict which orders are most likely to result in dissatisfied customers.

---

# Skills Demonstrated

- SQL
- Data Cleaning
- ETL
- Exploratory Data Analysis
- Feature Engineering
- Machine Learning
- Predictive Analytics
- Power BI
- Data Visualisation
- Business Intelligence
- Dashboard Design
- DAX

---

# Dataset
**Dataset:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
The raw and processed datasets are not included in this repository due to file size limitations but can be downloaded from the original dataset source.

This dataset contains information about:
- Customers
- Orders
- Products
- Payments
- Reviews
- Sellers
- Geolocation

---

# Tools Used

## SQL (MySQL)

- Data exploration
- Data cleaning
- Joins
- Aggregate functions
- Entity Relationship Diagram (ERD)
- Common Table Expressions (CTEs)
- Business KPI analysis
<img width="1915" height="1078" alt="ERD" src="https://github.com/user-attachments/assets/1c19d321-06e7-4f17-845b-148921e41855" />

---
# SQL Business Questions Answered
Examples include:

- Total Revenue Generated
- Monthly Sales Trend
- Revenue Growth
- Top Selling Product Categories
- Average Delivery Time
- Customer Review Distribution
- Most Popular Payment Methods
- Orders by State
- Seller Performance
- Freight Cost Analysis

## Python

Libraries used:
- Pandas
- NumPy
- Scikit-learn
- ftfy
<img width="658" height="788" alt="removing spaces and cleaning texts" src="https://github.com/user-attachments/assets/9c7c0859-8d46-40a0-9ed6-8d7d72c041e7" />
<img width="885" height="708" alt="using ftfy library to fix the dataset" src="https://github.com/user-attachments/assets/562cbd00-e63a-496e-ba82-791bcc885e1b" />
<img width="551" height="396" alt="pipeline" src="https://github.com/user-attachments/assets/6af4f3d0-0c7d-4bdd-a0fc-77b836c96453" />



Tasks completed:

- Data cleaning
- Missing value handling
- Feature engineering
- Fixing texts with the ftfy library
- Train and test split
- Machine Learning model development
- Model evaluation
- Prediction generation

---

## Machine Learning

### Objective

Predict whether a customer will be satisfied with their purchase.
Target Variable

```
predicted_satisfaction
```
Classification

- 1 as the Satisfied Customer
- 0 as the High Risk Customer

Model Evaluation
- Accuracy
- Precision
---

## Power BI
Interactive dashboards were created to visualise:

### Executive Dashboard
- Total Revenue
- Total Orders
- Happy Customers
- High Risk Customers
- Monthly Revenue Trend
- Orders by State
- Payment Type Distribution

### AI Prediction Dashboard

- Prediction Distribution
- Satisfaction Probability
- Payment Type vs Satisfaction
- State Performance
- High Risk Orders Table

---

# Machine Learning Workflow

```
Raw Dataset
      │
      ▼
Data Cleaning
      │
      ▼
Feature Engineering
      │
      ▼
Train/Test Split
      │
      ▼
Model Training
      │
      ▼
Predictions
      │
      ▼
Power BI Dashboard
```
---

# Project Structure

```
Brazilian-Ecommerce-Analytics/
│
├── OLIST DATA/
│   ├── raw/
│   └── processed/
│
├── sql/
│   ├── OLIST.sql
│   ├── ANALYSIS_FOR_OLIST.sql
│
├── python_notebooks/
│   ├── Olist_Data_Clean.ipynb
│   ├── olist_machine_learning.ipynb
│
├── dashboards/
│   ├── Customer Satisfaction Dashboard.pbix
│
├── SCREENSHOTS/
│
├── README.md
```

---

# Key Insights

Some insights discovered during analysis include:

- Revenue fluctuated throughout the observation period with noticeable sales peaks.
- Credit cards were the most frequently used payment method.
- Customer satisfaction varied across different states.
- Delivery performance and payment behaviour influenced customer satisfaction.
- Machine learning predictions identified customers at higher risk of dissatisfaction.

---

# Dashboard Screenshots

| Dashboard | Description |
|------------|-------------|
| Executive Summary | Business KPIs and trends |
| AI Predictions | Customer satisfaction predictions |

---

# Future Improvements

- Deploy the model as a web application.
- Automate data refresh using Power BI Service.
- Incorporate additional machine learning algorithms for comparison.
- Build a real-time prediction pipeline.
- Add customer segmentation analysis.

---

# Author

**Peter Oladipupo Amosu**

Data Analyst | Python | SQL | Power BI | Machine Learning

LinkedIn: [linkedin.com/in/peter-oladipupo-amosu-05210735b](linkedin.com/in/peter-oladipupo-amosu-05210735b)

GitHub: [https://github.com/dipoamosu](https://github.com/dipoamosu)

