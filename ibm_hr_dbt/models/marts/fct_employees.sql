-- One row per employee. The central table Power BI connects to.
-- Adds derived metrics useful for HR analysis.

SELECT
    employee_id,
    age,
    is_attrition,
    department,
    job_role,
    job_level,
    gender,
    marital_status,
    education_field,
    education_level,
    monthly_income,
    daily_rate,
    hourly_rate,
    pct_salary_hike,
    stock_option_level,
    business_travel,
    distance_from_home,
    overtime,
    job_satisfaction,
    environment_satisfaction,
    work_life_balance,
    relationship_satisfaction,
    job_involvement,
    performance_rating,
    years_at_company,
    years_in_current_role,
    years_since_last_promotion,
    years_with_curr_manager,
    total_working_years,
    num_companies_worked,
    training_times_last_year,
    CASE department
        WHEN 'Human Resources'       THEN 1
        WHEN 'Research & Development' THEN 2
        WHEN 'Sales'                 THEN 3
    END AS department_sort_order,

    -- Derived metrics
    CASE
        WHEN years_at_company <= 2  THEN '0-2 Years'
        WHEN years_at_company <= 5  THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END                                         AS tenure_band,

    CASE
        WHEN monthly_income < 3000  THEN 'Under $3K'
        WHEN monthly_income < 6000  THEN '$3K-$6K'
        WHEN monthly_income < 10000 THEN '$6K-$10K'
        ELSE '$10K+'
    END                                         AS income_band,

    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        ELSE '50+'
    END                                         AS age_band,

    -- Risk flag: employees with multiple high-risk attributes
    CASE
        WHEN overtime = 'Yes'
         AND years_since_last_promotion >= 3
         AND job_satisfaction IN ('1 - Low', '2 - Medium')
        THEN TRUE
        ELSE FALSE
    END                                         AS high_attrition_risk

FROM {{ ref('stg_ibm_hr') }}