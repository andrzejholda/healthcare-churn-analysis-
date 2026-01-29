# healthcare-churn-analysis-

## Project Overview :

The goal of this project is to analyze patient churn in a healthcare network and quantify revenue loss caused by churn.
Additionally, the project evaluates the potential ROI of a retention campaign (SMS) under different recovery scenarios.

Tech Stack :
* SQL (PostgreSQL),
* Power BI,
* DAX,
* Python (faker)

Data model :
* clinics,
* patient_visits,
* procedures
  
 Monthly grain was chosen to align churn definition with business reporting cycles.

 Key Outcomes (bullet points)
* Identified top churn-driving clinics and procedures,
* Quantified churn revenue (≈ X mln),
* Simulated retention campaign with dynamic recovery rate (10–20%), 
* Delivered actionable business recommendations

## Project Structure

```text
healthcare-churn-analysis/
│
├── README.md                  ← Project overview (for recruiters)
│
│
├── sql/
│   ├── 01_base_tables.sql
│   ├── 02_monthly_aggregation.sql
│   ├── 03_churn_identification.sql
│   └── README.md              ← SQL logic explained
│
├── dax/
│   ├── churn_measures.dax
│   ├── revenue_measures.dax
│   ├── campaign_simulation.dax
│   └── README.md              ← DAX measures explained
│
├── powerbi/
│    └── dashboard_screenshots/
│        ├── 01_overview.png
│        ├── 02_churn_analysis.png
│        ├── 03_sms_campaign_simulation.png
│        └── 04_insights.png
│
├── insights/
│   └── insights_and_recommendations.md
│
└── assumptions_and_limitations.md
