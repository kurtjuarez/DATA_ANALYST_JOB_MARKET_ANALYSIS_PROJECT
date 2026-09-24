/*
QUESTION: Which Data Analyst job titles have the highest average yearly salaries?
- Show the top 10 Data Analyst jobs that has the highest average yearly salary
- Filter to only consider Data Analyst jobs
- Group multiple job postings with the same job title
- Don't include average yearly salaries with NULL values
*/

SELECT
    job_title,
    ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary,
    COUNT(*) AS number_of_job_postings
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY job_title
ORDER BY avg_yearly_salary DESC
LIMIT 10