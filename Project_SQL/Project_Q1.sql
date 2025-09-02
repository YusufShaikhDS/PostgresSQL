select 
    j.job_id, 
    j.job_title_short, 
    j.job_title, 
    j.job_location, 
    j.job_schedule_type, 
    j.salary_year_avg, 
    j.job_posted_date, 
    cd.name as company_name
from job_postings_fact as j
left join company_dim as cd on j.company_id=cd.company_id
where 
    job_title_short = 'Data Analyst' and 
    job_location = 'Anywhere'and 
    salary_year_avg is NOT NULL
order by 
    salary_year_avg desc
limit 10;