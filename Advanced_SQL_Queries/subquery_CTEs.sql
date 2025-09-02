select * from 
(SELECT job_title_short, 
job_location, job_posted_date
from job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date) = 1);

with january_jjobs as (
    select *
    from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) = 1
)

select * from january_jjobs;

select company_id, 
name as company_name
from company_dim
where company_id in (select distinct company_id 
from job_postings_fact
where job_no_degree_mention = True
order by company_id);

with company_job_count as(
    select company_id, count(job_id) as jobs_posted
    from job_postings_fact
    group by company_id
    order by jobs_posted desc
)

select cd.name as company_name, cjc.jobs_posted
from company_dim as cd
left join company_job_count as cjc
on cjc.company_id=cd.company_id
order by jobs_posted desc;

SELECT skills 
from skills_dim 
where skill_id in (select skill_id from (select skill_id, count(skill_id) as skill_id_count 
from skills_job_dim
GROUP BY skill_id
limit 5));

SELECT company_id, count(job_id) as jobs_posted
from job_postings_fact
GROUP BY company_id
order by company_id;

select name as company_name,
(SELECT count(job_id) as jobs_posted
from job_postings_fact
GROUP BY company_id
order by company_id) as jobs_posted 
from company_dim
where company_id in (select company_id from (SELECT company_id, count(job_id) as jobs_posted
from job_postings_fact
GROUP BY company_id
order by company_id));

SELECT count(job_id) as jobs_posted
from job_postings_fact
GROUP BY company_id
order by company_id;

with Company_jobs_count as (SELECT company_id, count(job_id) as jobs_posted
from job_postings_fact as jpf
GROUP BY company_id
order by company_id)

select cjc.company_id,cd.name, cjc.jobs_posted,
case when jobs_posted > 50 then 'Large'
     when jobs_posted between 10 and 50 then 'Medium'
else 'Small'
end as company_category
from Company_jobs_count as cjc
left join company_dim as cd on cjc.company_id=cd.company_id
order BY cjc.company_id;

select * from job_postings_fact limit 100;

select * from job_postings_fact
where company_id in
(select company_id from company_dim 
where name in ('Cryptology','Accenture','Agoda')
limit 100)
;

with company_job_count as(
    select company_id, count(job_id) as jobs_posted
    from job_postings_fact
    group by company_id
    order by jobs_posted desc
)

select cd.name as company_name, cjc.jobs_posted
from company_dim as cd
left join company_job_count as cjc
on cjc.company_id=cd.company_id
order by jobs_posted desc;

with skill_analysis as(
    select  j.job_id, sj.skill_id, j.job_title_short, j.Job_location 
    from job_postings_fact as j
    left join skills_job_dim as sj
    on j.job_id=sj.job_id
    where job_work_from_home = True and job_title_short = 'Data Analyst'
    
)

select sd.skill_id, sd.skills,
count(s.job_id) as count_of_postings 
from skill_analysis as s
left join skills_dim as sd
on s.skill_id=sd.skill_id
group by sd.skill_id
order by count_of_postings desc
limit 5;


