-- INPUT: patient_visits
-- OUTPUT: fact_monthly_patient_activity
-- Grain: patient_id + month

WITH base AS (
    SELECT
        patient_id,
        DATE_TRUNC('month', visit_date) AS month,
        SUM(revenue) AS revenue
    FROM patient_visits
    WHERE status = 'Completed'
    GROUP BY 1,2
)

SELECT *
FROM base;
