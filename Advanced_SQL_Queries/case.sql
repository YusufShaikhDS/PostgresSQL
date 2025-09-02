SELECT * FROM job_postings_fact limit 100;

select min(salary_year_avg)
from job_postings_fact limit 100;

select count(job_id) as number_of_jobs,
case when job_location = 'Anywhere' then 'Remote'
     when job_location = 'New York, NY' then 'Local'
ELSE 'Onsite'
END AS Location_Category
from job_postings_fact
where job_title_short = 'Data Analyst'
GROUP BY Location_Category;

SELECT  job_title_short, salary_year_avg, 
CASE WHEN salary_year_avg >200000 THEN 'High'
     WHEN salary_year_avg >100000 THEN 'Standard'
     ELSE 'Low Salary'
END AS Payment_Category
FROM job_postings_fact
where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;