-- INPUT:
-- patient_visits
-- dim_clinics
-- dim_procedures
--
-- OUTPUT:
-- fact_patient_visits
--
-- Purpose:
-- Prepare clean visit-level fact table enriched with analytical dimensions

CREATE OR REPLACE VIEW fact_patient_visits AS
SELECT
    v.patient_id,
    v.visit_date,
    v.revenue,

    c.clinic_id,
    c.clinic_name,

    p.procedure_id,
    p.procedure_name,
    p.procedure_code

FROM patient_visits v
LEFT JOIN dim_clinics c
    ON v.clinic_id = c.clinic_id
LEFT JOIN dim_procedures p
    ON v.procedure_id = p.procedure_id

WHERE v.status = 'Completed'
  AND v.revenue >= 0
  AND v.visit_date IS NOT NULL;
