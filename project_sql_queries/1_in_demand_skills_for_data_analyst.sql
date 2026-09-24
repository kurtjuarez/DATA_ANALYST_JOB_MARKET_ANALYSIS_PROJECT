/*
QUESTION: What are the most in-demand skills for Data Analyst jobs?
- Show the top 10 in-demand skills for Data Analyst jobs
- Filter to only consider Data Analyst jobs
*/

SELECT
    skills_dim.skills AS skills,
    COUNT(*) AS number_of_job_postings
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    skills IS NOT NULL
GROUP BY skills
ORDER BY number_of_job_postings DESC
LIMIT 10