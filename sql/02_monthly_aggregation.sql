-- INPUT:
-- fact_patient_visits
--
-- OUTPUT:
-- fact_monthly_patient_activity
--
-- Grain:
-- patient_id + month + clinic_id + procedure_id

CREATE OR REPLACE VIEW fact_monthly_patient_activity AS
SELECT
    patient_id,
    DATE_TRUNC('month', visit_date) AS month,
    clinic_id,
    procedure_id,
    SUM(revenue) AS revenue,
    COUNT(*) AS visits_count
FROM fact_patient_visits
GROUP BY 1,2,3,4;
