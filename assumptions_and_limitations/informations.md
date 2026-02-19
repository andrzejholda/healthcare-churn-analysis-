## Assumptions

* Churn is defined as no activity in the following month.
* Revenue includes completed visits only.
* SMS campaign cost is assumed at 0.2 PLN per message, with 3 messages per patient.
* Recovery rate is simulated and not based on historical campaign data.
* Cohort and LTV calculations assume patients remain in the same cohort, and their LTV is measured cumulatively per cohort.
* Analysis assumes monthly granularity, so intra-month churn or multi-visit behavior is not captured.

## Limitations

* Dataset is synthetically generated and may not reflect real patient behavior.
* No patient satisfaction, referral, or marketing response data is available.
* Churn definition may overestimate churn for patients with long treatment cycles.
* ROI does not include operational costs beyond SMS campaign.
* Retention and LTV for the most recent cohorts may be incomplete due to partial data.
