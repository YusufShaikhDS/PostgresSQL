select sd.skill_id, sd.skills, count(sd.skill_id) as demand,
Round(avg(salary_year_avg),0) as average_sal
FROM job_postings_fact as j 
INNER JOIN skills_job_dim as sj ON j.job_id = sj.job_id
inner JOIN skills_dim as sd ON sj.skill_id = sd.skill_id
WHERE j.job_title_short = 'Data Analyst' AND
      j.salary_year_avg IS NOT NULL AND
      j.job_work_from_home = FALSE
GROUP BY sd.skill_id
order by demand DESC, average_sal desc
limit 100;