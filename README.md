# Healthcare_Patient_Metrics_And_Patient_Flow_Analysis

<p align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)

</p>

---

A **data analytics and business intelligence project** focused on understanding patient flow, admissions, waiting time, and patient satisfaction using **Excel, PostgreSQL, and Power BI**.

## Project Overview

This project analyzes **9,216 healthcare patient records** to identify patterns in:

- Patient volume by department
- Admission rates
- Patient waiting time
- Patient satisfaction
- Monthly admission trends
- Patient demographics
- Satisfaction score data coverage

The project workflow is:

**Data Cleaning → Exploratory Analysis → SQL Analysis → Power BI Dashboard → Insights**

## Dataset

The cleaned dataset contains **9,216 patient records** with these fields:

| Column | Description |
|---|---|
| Patient Id | Unique patient identifier |
| Patient Admission Date | Patient visit/admission date |
| Patient Admission Time | Patient visit/admission time |
| Patient Gender | Patient gender |
| Patient Age | Patient age |
| Patient Race | Patient race category |
| Department Referral | Referred department |
| Patient Admission Flag | Admission / Not Admission |
| Patient Satisfaction Score | Recorded satisfaction score |
| Patient Waittime | Patient waiting time in minutes |

### Data Quality

- Duplicate rows: **0**
- Duplicate Patient IDs: **0**
- Patient age: **1–79**
- Wait time: **10–60 minutes**
- Admission dates: **01-04-2023 to 30-10-2024**
- Satisfaction scores available for **2,517 of 9,216 patients (27.31%)**
- Missing satisfaction scores were retained as blank and **not imputed**

## Key KPIs

| KPI | Value |
|---|---:|
| Total Patients | **9,216** |
| Admission Rate | **50.04%** |
| Average Patient Wait Time | **35.26 min** |
| Average Patient Satisfaction Score | **4.99 / 10** |
| Satisfaction Score Coverage | **27.31%** |

> Satisfaction metrics are calculated only from patients with recorded satisfaction scores.

## Analysis Performed

### Excel

Data cleaning and exploratory analysis included:

- Duplicate and missing-value checks
- Data validation
- Category correction
- Department analysis
- Race analysis
- Age-group analysis
- Admission analysis
- Wait-time analysis
- Satisfaction analysis
- Monthly trend analysis

### PostgreSQL

SQL analysis included:

- Aggregations and KPI calculations
- GROUP BY analysis
- CASE-based age groups
- Department-level metrics
- Admission-rate analysis
- Monthly analysis
- Satisfaction coverage analysis
- Analytical SQL queries and window functions

### Power BI

An interactive dashboard was created with:

#### KPI Cards

- Total Patients
- Admission Rate
- Average Wait Time
- Average Satisfaction Score
- Satisfaction Score Coverage

#### Main Visuals

- Patient Count by Department
- Patient Admission Status
- Average Wait Time by Department
- Average Satisfaction Score by Department
- Admission Rate by Department
- Monthly Admission Rate Trend

#### Slicers

- Department
- Admission Date
- Patient Gender
- Admission Status

## Key Findings

- The dataset contains **9,216 patients** with an overall admission rate of **50.04%**.
- Average patient waiting time is **35.26 minutes**.
- The average recorded satisfaction score is **4.99/10**.
- Satisfaction data coverage is **27.31%**, so satisfaction findings represent patients with recorded scores only.
- **None** is the largest department-referral category with **5,400 patients**.
- **General Practice** is the next largest category with **1,840 patients**.
- Department-level admission rates are around 50%, with variation across departments.
- Monthly admission rates vary over time, allowing periods of higher and lower admission activity to be identified.
## Project Structure

```text
Healthcare_Patient_Metrics_And_Patient_Flow_Analysis/
│
├── Dashboard Image/
│   └── Healthcare Patient Metrics Dashboard screenshots
│
├── Excel/
│   └── Cleaned data and Excel analysis
│
├── Power BI/
│   └── Healthcare Patient Metrics Dashboard (.pbix)
│
├── SQL/
│   └── PostgreSQL queries and analysis
│
└── README.md

```

### Tools & Technologies

Microsoft Excel
PostgreSQL
Power BI
SQL
Data Cleaning
Exploratory Data Analysis
Dashboard Design
Business Intelligence
Dashboard Preview

The Power BI dashboard provides an interactive view of patient flow, admissions, waiting time, and satisfaction metrics.


### Project Objective

The main objective of this project is to demonstrate how raw healthcare data can be transformed into clean, structured, and actionable business insights using SQL, Excel, and Power BI.

### Author

Darshan Patel

GitHub:[darshanpatel-IT](https://github.com/darshanpatel-IT)

LinkedIn: [darshan patel](www.linkedin.com/in/darshan-patel-a75124288)











