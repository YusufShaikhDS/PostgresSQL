SELECT job_posted_date from job_postings_fact limit 100;

select '2025-08-22'::Date,
              '123':: INT,
              'false'::Boolean,
              '3.04'::float;

select job_posted_date::Date from job_postings_fact limit 10;

select job_title_short as title,
job_location as location,
job_posted_date::Date as Date
 from job_postings_fact limit 100;

select job_title_short as title,
job_location as location,
job_posted_date at time zone 'UTC' at time zone 'IST'
 from job_postings_fact limit 5;

select job_title_short as title,
job_location as location,
job_posted_date::Date as Date,
EXTRACT (year from job_posted_date) as Job_year,
EXTRACT (MONTH from job_posted_date) as Job_Month,
EXTRACT (DAY from job_posted_date) as Job_day
 from job_postings_fact limit 5;

select count(job_id) as job_posted,
EXTRACT (month from job_posted_date) as month
from job_postings_fact
where job_title_short like 'Data Analyst'
GROUP BY MONTH
ORDER BY job_posted DESC;

SELECT avg(salary_year_avg) as yearly_averge_income, 
avg(salary_hour_avg) as hourly_average_income, 
job_schedule_type
from job_postings_fact
where job_posted_date > '2023-06-01' 
GROUP BY job_schedule_type
order by yearly_averge_income;

select count(job_id) as job_posted,
EXTRACT(month from (job_posted_date at time zone 'UTC' at time zone 'America/New_York')) as Job_month
FROM job_postings_fact
where EXTRACT(year from job_posted_date) = '2023'
GROUP BY job_month
order by job_month;

select cd.name
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id=cd.company_id
where (jpf.job_health_insurance = True) and (EXTRACT (year from jpf.job_posted_date) = '2023') and (EXTRACT (month from jpf.job_posted_date) between 4 and 6)
GROUP BY cd.name
limit 100;

select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 1;

select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 2; 

select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 3;

select distinct (EXTRACT (year from job_posted_date)) as year from  job_postings_fact;