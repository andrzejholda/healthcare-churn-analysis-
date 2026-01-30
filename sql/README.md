SQL Logic Overview:
  
01_base_tables.sql
Purpose:
- Clean raw visit-level data
- Filter completed visits
- Prepare base fact table

### 02_monthly_aggregation.sql
Purpose:
- Aggregate data to monthly grain
- Calculate monthly revenue per patient
- Prepare dataset for churn analysis

Output:
- patient_id
- month
- clinic_id
- revenue

### 03_churn_identification.sql
Purpose:
- Identify churn using LEAD(month)
- Flag patients inactive in the following month
- Avoid false churn at dataset boundaries
