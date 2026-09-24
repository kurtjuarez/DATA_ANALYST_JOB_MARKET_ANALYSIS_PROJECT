/*
QUESTION: How do Data Analyst job postings and average salaries vary by location?
- Identify the locations with the most number of job postings, then compare their average salaries
*/

SELECT
    job_location,
    COUNT(*) AS number_of_job_postings,
    ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary
FROM job_postings_fact
WHERE
    job_location IS NOT NULL AND
    salary_year_avg IS NOT NULL
GROUP BY job_location
HAVING COUNT(*) >= 100 -- Better to use a higher number of job postings to have a more meaningful insights
ORDER BY number_of_job_postings DESC -- Change to number_of_job_postings to make order by number of job postings
LIMIT 10