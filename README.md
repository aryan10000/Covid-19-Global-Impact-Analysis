# COVID-19 Global Impact Analysis

## Project Overview

This end-to-end analytics project explores the global impact of COVID-19 using SQL and Tableau. The analysis focuses on infection trends, mortality rates, vaccination progress, and country-level comparisons to uncover meaningful public health insights.

The project follows a complete analytics workflow:

- Data Cleaning & Transformation
- Exploratory Data Analysis (EDA)
- SQL-Based Analysis
- Advanced SQL Techniques
- Interactive Tableau Dashboard Development
- Insight Generation & Visualization

The objective was to transform raw COVID-19 datasets into actionable insights through data analysis and dashboarding.

---

## Dashboard Preview

<img width="1280" height="832" alt="covid_dashboard" src="https://github.com/user-attachments/assets/22a471a2-74db-48d7-bfe6-5fe97d2e9b2e" />

---

## Tableau Dashboard

🔗 **Interactive Dashboard:**  
[View Dashboard on Tableau Public](https://public.tableau.com/shared/F6JMXMCB9?:display_count=n&:origin=viz_share_link)

---

## Tools Used

### Database
- MySQL

### Visualization
- Tableau Public

### Data Source
- Excel / CSV

---

## Dataset

The project uses two datasets:

1. CovidDeaths
2. CovidVaccinations

Key fields include:

- Location
- Date
- Population
- Total Cases
- New Cases
- Total Deaths
- Vaccination Data

---

## SQL Tasks Performed

### Data Cleaning

- Replaced blank values with NULL
- Modified incorrect datatypes
- Standardized imported fields
- Data validation and preparation

### Exploratory Data Analysis

Business questions answered:

- Total Cases vs Total Deaths
- Infection Rate by Country
- Death Count by Country
- Death Count by Continent
- Global Death Percentage
- Population Infection Percentage

### Advanced SQL Concepts

Implemented:

- Window Functions
- Rolling Vaccination Analysis
- Common Table Expressions (CTEs)
- Temporary Tables
- Views

---

## Dashboard Features

### Global Numbers

Displays:

- Total Cases
- Total Deaths
- Global Death Percentage

### Total Deaths by Continent

Compares cumulative COVID-19 deaths across continents.

### Global Infection Map

Interactive map showing infection percentage by country.

### Population Infection Forecast

Forecasts future infection percentages for selected countries.

---

## Project Architecture

```text
COVID-19 Dataset
      │
      ▼
Data Cleaning & Transformation
      │
      ▼
SQL Analysis
      │
      ▼
Advanced SQL (CTEs, Views, Window Functions)
      │
      ▼
Tableau Dashboard
      │
      ▼
Insights & Visualization
```

---

## Key Insights

- Europe recorded the highest COVID-19 death toll, exceeding 1 million deaths.
- The United States had the highest infection rate among major countries, reaching nearly 19% of its population.
- North America and Europe emerged as the most heavily impacted regions in terms of infections and fatalities.
- Forecast models indicated continued infection growth through late 2021, particularly in the United States and Western Europe.

---

## Business Impact

This analysis helped identify:

- Global infection trends
- High-risk regions
- Vaccination progress patterns
- Mortality rate differences across countries
- Geographic variations in pandemic impact

The findings support data-driven understanding of public health outcomes and global pandemic trends.

---

## Project Files

- `covid_project.sql` → SQL analysis and data exploration queries
- `README.md` → Project documentation

---

## Author

Aryan Soni

Data Analytics | SQL | MySQL | Tableau

GitHub: https://github.com/aryan10000
