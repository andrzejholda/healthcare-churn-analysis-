-- INPUT:
-- cohort_age_activity
--
-- OUTPUT:
-- cohort_retention
--
-- Purpose:
-- Aggregate active patients per cohort month and cohort age to calculate retention
--
-- Grain:
-- One row per cohort month per cohort age
--
-- Key logic:
-- Counts distinct active patients per cohort age to compute retention metrics

CREATE OR REPLACE VIEW cohort_retention AS
SELECT
    cohort_month,
    cohort_age,
    COUNT(DISTINCT patient_id) AS active_patients
FROM cohort_age_activity
GROUP BY 1,2;
