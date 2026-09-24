/*
QUESTION: Which Data Analyst skills has the highest average salaries yearly?
- Show the top 10 skills related to Data Analyst based on average yearly salaries
- Filter to only consider Data Analyst jobs
*/

SELECT
    skills_dim.skills AS skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    skills IS NOT NULL AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_yearly_salary DESC
LIMIT 10