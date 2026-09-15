-- Most Optimal Skills to Learn
-- Optimal = High Demand And High Salary

SELECT 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS job_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM 
    skills_job_dim
JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_postings_fact.job_work_from_home = TRUE 
GROUP BY 
    skills_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) > 10 -- En az 10 ilanda geçen yetenekleri alır (gürültüyü engeller)
ORDER BY 
    avg_salary DESC,  job_count DESC
LIMIT 25