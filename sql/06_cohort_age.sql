-- INPUT:
-- cohort_activity
--
-- OUTPUT:
-- cohort_age_activity
--
-- Purpose:
-- Calculate the cohort age (in months) for each patient activity record
--
-- Grain:
-- One row per patient per cohort age per activity month

CREATE OR REPLACE VIEW cohort_age_activity AS
SELECT
    patient_id,
    cohort_month,
    activity_month,
    revenue,
    (
        EXTRACT(YEAR FROM activity_month) * 12 + EXTRACT(MONTH FROM activity_month)
      - EXTRACT(YEAR FROM cohort_month) * 12 - EXTRACT(MONTH FROM cohort_month)
    ) AS cohort_age
FROM cohort_activity;
