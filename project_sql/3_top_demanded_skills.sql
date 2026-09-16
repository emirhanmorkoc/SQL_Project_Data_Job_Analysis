-- What are the top demanded skills for Data Analyst working remotely?
SELECT
    skills_dim.skills,
    COUNT(skills_dim.skills) AS skill_count
FROM 
    skills_job_dim  
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    skill_count DESC
LIMIT 5


