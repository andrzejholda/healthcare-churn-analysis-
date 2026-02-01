-- INPUT:
-- fact_monthly_patient_activity
--
-- OUTPUT:
-- churn_flagged_activity
--
-- Churn definition:
-- A patient is considered churned in month M
-- if they are not active in month M+1

CREATE OR REPLACE VIEW churn_flagged_activity AS
WITH activity AS (
    SELECT
        patient_id,
        month,
        clinic_id,
        procedure_id,
        revenue,
        visits_count,
        LEAD(month) OVER (
            PARTITION BY patient_id
            ORDER BY month
        ) AS next_month
    FROM fact_monthly_patient_activity
),

churn_flag AS (
    SELECT
        *,
        CASE
            WHEN next_month IS NULL 
                THEN 1
            WHEN next_month > month + INTERVAL '1 month' 
                THEN 1
            ELSE 0
        END AS is_churn
    FROM activity
)

SELECT *
FROM churn_flag;

