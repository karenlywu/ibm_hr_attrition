{% docs fct\_employees %}

One row per IBM HR employee. Core fact table for the Power BI HR dashboard.



Derived fields added in this model:

\- `tenure\_band`: bucketed years at company (0-2, 3-5, 6-10, 10+)

\- `income\_band`: bucketed monthly income ranges

\- `age\_band`: bucketed age ranges

\- `high\_attrition\_risk`: boolean flag for employees meeting

&#x20; 3 simultaneous high-risk criteria (overtime + stale promotion

&#x20; + low job satisfaction)

{% enddocs %}

