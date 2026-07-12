-- Cleans and renames raw IBM HR data.
-- Drops constant columns (EmployeeCount, StandardHours, Over18)
-- Decodes numeric satisfaction scores to readable labels
-- Creates boolean attrition flag

SELECT
    "EmployeeNumber"                    AS employee_id,
    "Age"                               AS age,

    -- Attrition as boolean (easier to aggregate in Power BI)
    CASE WHEN "Attrition" = 'Yes'
         THEN TRUE ELSE FALSE END       AS is_attrition,

    "Department"                        AS department,
    "JobRole"                           AS job_role,
    "JobLevel"                          AS job_level,
    "Gender"                            AS gender,
    "MaritalStatus"                     AS marital_status,
    "EducationField"                    AS education_field,

    -- Decode numeric education to label
    CASE "Education"
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END                                 AS education_level,

    "MonthlyIncome"                     AS monthly_income,
    "DailyRate"                         AS daily_rate,
    "HourlyRate"                        AS hourly_rate,
    "PercentSalaryHike"                 AS pct_salary_hike,
    "StockOptionLevel"                  AS stock_option_level,

    "BusinessTravel"                    AS business_travel,
    "DistanceFromHome"                  AS distance_from_home,
    "OverTime"                          AS overtime,

    -- Decode numeric satisfaction scores to labels
    CASE "JobSatisfaction"
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END                                 AS job_satisfaction,

    CASE "EnvironmentSatisfaction"
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END                                 AS environment_satisfaction,

    CASE "WorkLifeBalance"
        WHEN 1 THEN '1 - Bad'
        WHEN 2 THEN '2 - Good'
        WHEN 3 THEN '3 - Better'
        WHEN 4 THEN '4 - Best'
    END                                 AS work_life_balance,

    CASE "RelationshipSatisfaction"
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END                                 AS relationship_satisfaction,

    CASE "JobInvolvement"
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END                                 AS job_involvement,

    CASE "PerformanceRating"
        WHEN 3 THEN '3 - Meets Expectations'
        WHEN 4 THEN '4 - Exceeds Expectations'
    END                                 AS performance_rating,

    "YearsAtCompany"                    AS years_at_company,
    "YearsInCurrentRole"                AS years_in_current_role,
    "YearsSinceLastPromotion"           AS years_since_last_promotion,
    "YearsWithCurrManager"              AS years_with_curr_manager,
    "TotalWorkingYears"                 AS total_working_years,
    "NumCompaniesWorked"                AS num_companies_worked,
    "TrainingTimesLastYear"             AS training_times_last_year

    -- Intentionally dropped: EmployeeCount (constant = 1),
    -- StandardHours (constant = 80), Over18 (constant = Y)
    -- These add no analytical value and would inflate model size

FROM {{ source('ibm_hr', 'raw_ibm_hr') }}