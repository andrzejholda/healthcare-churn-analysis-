-- INPUT:
-- cohort_base
-- patient_visits
--
-- OUTPUT:
-- cohort_activity
--
-- Purpose:
-- Track monthly patient activity and revenue relative to cohort
--
-- Grain:
-- One row per patient per activity month

CREATE OR REPLACE VIEW cohort_activity AS
SELECT
    c.patient_id,
    c.cohort_month,
    DATE_TRUNC('month', p.visit_date) AS activity_month,
    SUM(p.revenue) AS revenue
FROM cohort_base c
JOIN patient_visits p
    ON c.patient_id = p.patient_id
GROUP BY 1,2,3;
