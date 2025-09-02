select 
    sd.skill_id,
    sd.skills,
    count(sd.skill_id) as skills_count 
from job_postings_fact j
inner join skills_job_dim as sj on j.job_id = sj.job_id
inner join skills_dim as sd on sj.skill_id = sd.skill_id
where job_title_short = 'Data Analyst' AND
      job_location like '%India%' 
group BY sd.skill_id
order by skills_count desc
limit 5;

