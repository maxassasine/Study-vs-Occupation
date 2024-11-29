create database Career_change;
use Career_change;

SHOW COLUMNS FROM cleaned_dataset;

create view Family_Influence_Count as
SELECT count(*) as Count
from cleaned_dataset
where family_influence = 'none';

SELECT 
    education_level, 
    current_occupation, 
    COUNT(*) AS count
FROM 
    cleaned_dataset
GROUP BY 
    education_level, current_occupation
ORDER BY 
    count DESC;

SELECT 
    skills_gap, 
    AVG(salary) AS avg_salary
FROM 
    cleaned_dataset
GROUP BY 
    skills_gap
ORDER BY 
    skills_gap;

describe cleaned_dataset;


SELECT 
    work_life_balance, 
    AVG(job_satisfaction) AS avg_satisfaction
FROM 
    cleaned_dataset
GROUP BY 
    work_life_balance
ORDER BY 
    work_life_balance DESC;
    


SELECT 
    field_of_study, 
    years_of_experience, 
    AVG(salary) AS avg_salary
FROM 
    cleaned_dataset
GROUP BY 
    field_of_study, years_of_experience
ORDER BY 
    field_of_study, years_of_experience;

SELECT 
    years_of_experience, 
    AVG(industry_growth_rate) AS avg_growth_rate
FROM 
    cleaned_dataset
GROUP BY 
    years_of_experience
ORDER BY 
    years_of_experience;

SELECT 
    field_of_study, 
    years_of_experience, 
    AVG(salary) AS avg_salary
FROM 
    cleaned_dataset
GROUP BY 
    field_of_study, years_of_experience
ORDER BY 
    field_of_study, years_of_experience;

WITH cte AS (
    SELECT 
        NTILE(10) OVER (ORDER BY salary) AS salary_percentile
    FROM 
        cleaned_dataset
)
SELECT 
    salary_percentile, 
    COUNT(*) AS count
FROM 
    cte
GROUP BY 
    salary_percentile
ORDER BY 
    salary_percentile;

SELECT 
    geographic_mobility, 
    COUNT(*) AS count
FROM 
    cleaned_dataset
GROUP BY 
    geographic_mobility
ORDER BY 
    geographic_mobility DESC;
    
    SELECT 
    mentorship_available, 
    AVG(career_change_interest) AS avg_interest
FROM 
    cleaned_dataset
GROUP BY 
    mentorship_available
ORDER BY 
    avg_interest DESC;

SELECT 
    CASE 
        WHEN career_change_events > 3 THEN 'High Change Factors'
        ELSE 'Low Change Factors'
    END AS change_category, 
    COUNT(*) AS count
FROM 
    cleaned_dataset
GROUP BY 
    change_category;

SELECT 
    field_of_study, 
    AVG(job_opportunities) AS avg_opportunities
FROM 
    cleaned_dataset
GROUP BY 
    field_of_study
ORDER BY 
    avg_opportunities DESC;

SELECT 
    current_occupation, 
    AVG(likely_to_change_occupation) AS avg_likelihood
FROM 
    cleaned_dataset
GROUP BY 
    current_occupation
ORDER BY 
    avg_likelihood DESC;

SELECT 
    gender, 
    AVG(salary) AS avg_salary
FROM 
    cleaned_dataset
GROUP BY 
    gender
ORDER BY 
    avg_salary DESC;

SELECT 
    certifications, 
    AVG(job_security) AS avg_security
FROM 
    cleaned_dataset
GROUP BY 
    certifications
ORDER BY 
    avg_security DESC;

SELECT COUNT(DISTINCT field_of_study) AS unique_fields, 
       COUNT(DISTINCT current_occupation) AS unique_occupations
FROM cleaned_dataset;

SELECT field_of_study, current_occupation, COUNT(*) AS count
FROM cleaned_dataset
GROUP BY field_of_study, current_occupation
ORDER BY count DESC;

SELECT 
    current_occupation, 
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cleaned_dataset), 2) AS percentage
FROM 
    cleaned_dataset
GROUP BY 
    current_occupation
ORDER BY 
    percentage DESC;


SELECT field_of_study, 
       COUNT(DISTINCT current_occupation) AS occupation_variety
FROM cleaned_dataset
GROUP BY field_of_study
ORDER BY occupation_variety DESC;








