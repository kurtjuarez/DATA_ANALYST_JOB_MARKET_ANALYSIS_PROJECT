/*
QUESTION: Which Data Analyst skills offer a combination of high demand and high average yearly salary?
- Show the top 10 skills related to Data Analyst based on the combination of demand and average yearly salary
- Have a combined score of demand and salary
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id AS id,
        COUNT(*) AS number_of_job_postings
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        skills IS NOT NULL
    GROUP BY id
), skills_salary AS (
    SELECT
        skills_dim.skill_id AS id,
        ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        skills IS NOT NULL AND
        salary_year_avg IS NOT NULL
    GROUP BY id
)

SELECT
    skills_dim.skills,
    skills_demand.number_of_job_postings,
    skills_salary.avg_yearly_salary,
    ROUND((skills_demand.number_of_job_postings + skills_salary.avg_yearly_salary)/2, 2) AS combined_score
FROM skills_dim
INNER JOIN skills_demand ON skills_dim.skill_id = skills_demand.id
INNER JOIN skills_salary ON skills_dim.skill_id = skills_salary.id
ORDER BY combined_score DESC
LIMIT 10