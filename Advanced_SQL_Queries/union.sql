select j.job_id, sd.skills, sd.type
from january_jobs as j
left join skills_job_dim as sj on j.job_id=sj.job_id
left join skills_dim as sd on sj.skill_id=sd.skill_id

union all

select f.job_id, sd.skills, sd.type
from february_jobs as f
left join skills_job_dim as sj on f.job_id=sj.job_id
left join skills_dim as sd on sj.skill_id=sd.skill_id

UNION all

select m.job_id, sd.skills, sd.type
from march_jobs as m
left join skills_job_dim as sj on m.job_id=sj.job_id
left join skills_dim as sd on sj.skill_id=sd.skill_id;

with union_tables_Q1 as(
    select job_id, job_title_short, job_posted_date, salary_year_avg from january_jobs
    UNION ALL
    select job_id, job_title_short, job_posted_date, salary_year_avg from february_jobs
    UNION ALL
    select job_id, job_title_short, job_posted_date, salary_year_avg from march_jobs
)

select u.job_id,u.job_title_short, u.job_posted_date, u.salary_year_avg,sd.skills, sd.type 
from union_tables_Q1 as u
left join skills_job_dim as sj on u.job_id=sj.job_id
left join skills_dim as sd on sj.skill_id=sd.skill_id
where u.salary_year_avg >= 75000 AND
u.job_title_short = 'Data Analyst';