-- Department-level attrition summary.
-- Pre-aggregating here rather than in DAX keeps
-- Power BI logic simpler and lets us test the numbers in dbt.

SELECT
    department,
    COUNT(*)                                    AS total_employees,
    SUM(CASE WHEN is_attrition THEN 1 ELSE 0 END)
                                                AS attrition_count,
    COUNT(*) - SUM(CASE WHEN is_attrition THEN 1 ELSE 0 END)
                                                AS retained_count,
    ROUND(
        SUM(CASE WHEN is_attrition THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100, 2
    )                                           AS attrition_rate_pct,
    ROUND(AVG(monthly_income), 2)               AS avg_monthly_income,
    ROUND(AVG(years_at_company), 2)             AS avg_tenure

FROM {{ ref('fct_employees') }}
GROUP BY department
ORDER BY attrition_rate_pct DESC