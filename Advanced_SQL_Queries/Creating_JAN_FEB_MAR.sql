--Januray
create table january_jobs as
select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 1;

--February
create table february_jobs as
select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 2; 

--March
create table march_jobs as
select * from job_postings_fact
where EXTRACT(month from job_posted_date) = 3; 