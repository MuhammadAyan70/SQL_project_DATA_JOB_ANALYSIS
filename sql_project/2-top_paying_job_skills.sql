WITH top_paying_data_analyst_jobs AS (
SELECT
    job_id,
    job_title,
    name AS company_name,
    salary_year_avg AS average_salary
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_data_analyst_jobs.*,
    skills_dim.skills
FROM top_paying_data_analyst_jobs
INNER JOIN skills_job_dim ON top_paying_data_analyst_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    average_salary DESC


/*
Skill	Frequency (out of 10 jobs)	Percentage of Jobs
SQL	                       10	        100%
Python	                   9	        90%
Tableau	                   7	        70%
R	                       5	        50%
Excel	                   4	        40%
AWS	                       3	        30%
Azure	                   3	        30%
Snowflake	               3	        30%
Pandas	                   3	        30%
Power BI	               2	        20%
Git / GitLab	           2	        20%
Oracle	                   2	        20%
Jira / Confluence          2	        20%
Bitbucket / Atlassian	   2	        20%

Key Insight:
SQL is non-negotiable. It appears in every single top-paying job listing.
Python is a very close second, solidifying its position as the leading programming language for data analysis.
*/