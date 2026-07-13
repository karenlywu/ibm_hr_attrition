# Data Analyst Portfolio Project: IBM HR Attrition: Power BI + dbt



**Author:** Karen Wu

**Date:** July 11, 2026



### Dataset: IBM HR Analytics Employee Attrition \& Performance (Kaggle): 
- 1,470 employees, 35 columns, synthetic but realistically patterned data created by IBM data scientists.



### The business question: 

- Which factors most strongly predict employee attrition and what should HR prioritize to reduce it? 







## Worklog:
- WIP: page 2 - waterfall chart of headcount by dept
    - todo: use dbt to create a dept role sort to create a better view
- Built page 1 - attrition overview
- RLS role configured to restrict data by department: in production deployment, a manager mapping table would link login email to authorized department(s).
- IBM HR is a snapshot, so leave trend axis off 

