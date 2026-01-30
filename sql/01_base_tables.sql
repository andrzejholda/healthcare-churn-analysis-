-- Base fact table for patient visits
SELECT
    c.patient_id,
    c.visit_date,
    p.clinic_id,
    c.revenue,
    c.status
FROM clinic_visits c JOIN  public_clinics p ON c.patient_id = p.patient_id
WHERE status = 'Completed';
