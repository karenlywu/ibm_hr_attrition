# Data Analyst Portfolio Project: IBM HR Attrition: Power BI + dbt



**Author:** Karen Wu

**Date:** July 11, 2026



### Dataset: IBM HR Analytics Employee Attrition \& Performance (Kaggle): 
- 1,470 employees, 35 columns, synthetic but realistically patterned data created by IBM data scientists.



### The business question: 

- Which factors most strongly predict employee attrition and what should HR prioritize to reduce it? 







## Worklog:
- page 4 - satisfaction deep dive: added stacked bar chart to view attrition rate by job satisfaction, heat map matrix to compare attrition rate by work life balance and job satisfaction; interactive q&a slicers for dept and years at company
- Built page 3 - risk analysis factors: decomp tree, scatterplot and overtime attrition rate by dept with slicers
- Built page 2 - decided waterfall chart was overkill with such a small dataset, so just going with a couple bar charts to view view attrition rates by role and by dept.
- Built page 1 - attrition overview
- RLS role configured to restrict data by department: in production deployment, a manager mapping table would link login email to authorized department(s).
- IBM HR is a snapshot, so leave trend axis off 

