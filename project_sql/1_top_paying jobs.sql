/*
Question: What are the paying data jobs in Germany?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- Highlight the top-paying opportunities for Data, offering insights into employment options and location flexibility.
*/


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date


FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    --job_title_short = 'Data Scientist' AND 
    job_location LIKE '%Germany%' AND 
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 50;



-- The results of this query noted that Data Science/Machine Learning Roles are the top paying jobs
