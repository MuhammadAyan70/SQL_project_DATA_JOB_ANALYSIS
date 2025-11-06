SELECT 
    skills,
    round (avg(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home IS TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* Category,                       Average Salary,     Insight
-> Big Data & Processing,          "$150,271",         "The highest-paying group, driven by skills like PySpark, Databricks, and Airflow, indicating organizations are willing to pay a premium for professionals who can build and manage large-scale data pipelines."
-> Programming Languages,          "$149,375",         "Supported by high-paying languages like Swift and Golang, showing that general-purpose programming skills, especially those used in modern app and back-end development, are very valuable."
-> Data Analysis & ML Libraries,   "$145,876",         "Core data science tools like Pandas, NumPy, and Scikit-learn form a high-value group, proving foundational analytical skills are highly compensated."
-> DevOps & Version Control,       "$144,877",         "This category, including Bitbucket, GitLab, and Kubernetes, suggests that an analyst or engineer who can manage infrastructure and development lifecycles is highly sought after."
-> Databases & Search,             "$143,131",         "Skills like Couchbase and Elasticsearch indicate that expertise in specialized, NoSQL, or high-performance search databases is valued higher than traditional SQL-only skills."

Key Insight:
The data reveals that while traditional data analysis skills remain important, there is a significant premium on professionals who possess advanced technical skills in big data processing, programming, and DevOps.
This suggests a trend towards more complex data environments where the ability to handle large-scale data and integrate with modern development practices is crucial for higher compensation.
*/