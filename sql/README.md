# SQL Logic Overview

This project follows a layered SQL transformation approach to ensure clean data lineage, controlled granularity, and reproducible churn calculations.

## 01_base_tables.sql — Visit-Level Base Layer

Purpose

Clean raw visit-level data

Filter only completed and valid visits

Enrich fact table with clinic and procedure dimensions

Preserve visit-level granularity (1 row = 1 visit)

Output

fact_patient_visits

Grain

One row per patient visit

Key logic

Filters only Completed visits

Removes invalid revenue and missing dates

Uses controlled joins to dimension tables (no aggregation)

## 02_monthly_aggregation.sql — Monthly Activity Layer

Purpose

Aggregate visit-level data to monthly patient activity

Prepare dataset for churn analysis and BI reporting

Maintain analytical dimensions (clinic, procedure)

Output

fact_monthly_patient_activity

Grain

One row per patient per month per clinic per procedure

Key logic

Aggregates revenue at monthly level

Counts number of visits per month

Uses base fact table as input (no return to raw data)

## 03_churn_identification.sql — Churn Detection Layer

Purpose

Identify patient churn based on activity gaps

Avoid false churn at dataset boundaries

Create a churn-ready table for Power BI

Output

churn_flagged_activity

Churn definition

A patient is considered churned in month M if they are not active in month M+1

Key logic

Uses LEAD(month) to inspect future activity

Flags churn when:

No subsequent month exists

Gap between months is greater than one month

Churn is calculated at the patient level (global)

## Result

The final churn-flagged dataset is consumed directly by Power BI, where all KPIs, churn rates, revenue loss, and campaign simulations are calculated using DAX.
