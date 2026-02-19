-- INPUT:
-- patient_visits
--
-- OUTPUT:
-- cohort_base
--
-- Purpose:
-- Assign each patient to their first-visit cohort month for lifecycle analysis
--
-- Grain:
-- One row per patient

CREATE OR REPLACE VIEW cohort_base AS
SELECT
    patient_id,
    DATE_TRUNC('month', MIN(visit_date)) AS cohort_month
FROM patient_visits
GROUP BY patient_id;
