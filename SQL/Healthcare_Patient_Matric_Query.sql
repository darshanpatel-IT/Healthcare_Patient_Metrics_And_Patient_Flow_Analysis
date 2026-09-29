CREATE TABLE healthcare_final (
    patient_id VARCHAR(20),
    admission_date DATE,
    admission_time TIME,
    gender VARCHAR(20),
    age INT,
    race VARCHAR(100),
    department_referral VARCHAR(100),
    admission_flag VARCHAR(30),
    satisfaction_score NUMERIC(4,2),
    wait_time INT
);
INSERT INTO healthcare_final (
    patient_id,
    admission_date,
    admission_time,
    gender,
    age,
    race,
    department_referral,
    admission_flag,
    satisfaction_score,
    wait_time
)
SELECT
    patient_id,
    TO_DATE(admission_date, 'DD-MM-YYYY'),
    REPLACE(admission_time, '.', ':')::TIME,
    gender,
    age::INT,
    race,
    department_referral,
    admission_flag,
    NULLIF(satisfaction_score, '')::NUMERIC(4,2),
    wait_time::INT
FROM healthcare;

alter table healthcare_final
rename to healthcare;

select * from healthcare;


-- Q.1 How many total patients are present in the healthcare dataset?

select count(patient_id)
from healthcare;


-- Q.2 How many patients were admitted to the hospital?

select 
       count(patient_id) as admitted_patients
from healthcare
where admission_flag = 'Admission';


-- Q.3 What is the overall admission rate of patients?

select 
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as Admission_rate
from healthcare;
	  

-- Q.4 What is the average patient wait time in minutes?


select 
       round(avg(wait_time) ,2) as average_patients_wait_time
from healthcare;
	   

-- Q.5 What is the average patient satisfaction score among patients who have a recorded satisfaction score?

select 
       round(avg(satisfaction_score),2) as avg_satisfaction_score
from healthcare;


-- Q.6 How many patients are there in each department referral category?

select 
      department_referral,
	  count(patient_id) as total_patient
from healthcare
group by department_referral
order by total_patient desc;
	  

-- Q.7 What is the average patient wait time for each department referral category? 

select 
       department_referral,
	   round(avg(wait_time) ,2) as avg_patient_wait_time
from healthcare
group by department_referral
order by avg_patient_wait_time;


-- Q.8 What is the average patient satisfaction score for each department referral category?

select 
       department_referral,
	   round(avg(satisfaction_score) ,2) as avg_patient_satisfaction_score
from healthcare
group by department_referral
order by avg_patient_satisfaction_score desc;


-- Q.9 What is the number of patients in each gender category?

select 
       gender,
	   count(patient_id) as total_patients
from healthcare
group by gender
order by total_patients desc;


-- Q.10 What is the average patient satisfaction score for each gender?

select 
       gender,
	   round(avg(satisfaction_score) ,2) as avg_patient_satisfaction_score
from healthcare
group by gender
order by avg_patient_satisfaction_score desc;

                                 
-- Q.11 What is the average patient wait time for each gender?

select 
       gender,
	   round(avg(wait_time) ,2) as avg_patient_wait_time
from healthcare
group by gender
order by avg_patient_wait_time;


-- Q.12 How many patients are there in each race category?

select 
       race,
	   count(patient_id) as total_patients
from healthcare
group by race
order by total_patients desc;


-- Q.13 What is the average patient satisfaction score for each race category?

select race,
       round(avg(satisfaction_score) ,2) as avg_satisfaction_score
from healthcare
group by race
order by avg_satisfaction_score desc;

                                                                                                                                                                                             
-- Q.14 What is the average patient wait time for each race category?

select race,
       round(avg(wait_time),2) as avg_wait_time
from healthcare
group by race
order by avg_wait_time desc;


-- Q.15 What is the admission rate for each gender?

select gender,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as admission_rate
from healthcare
group by gender
order by admission_rate desc;
	   

-- Q.16 What is the admission rate for each race category?

select race,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as admission_rate
from healthcare
group by race
order by admission_rate desc;
	   

-- Q.17 What is the average wait time for admitted patients versus not-admitted patients?

select admission_flag,
       round(avg(wait_time),2) as avg_wait_time
from healthcare
group by admission_flag
order by avg_wait_time desc;
       
	   
-- Q.18 What is the average satisfaction score for admitted patients versus not-admitted patients?

select admission_flag,
       round(avg(satisfaction_score),2) as avg_satisfaction_score
from healthcare
group by admission_flag
order by avg_satisfaction_score desc;


-- Q.19 What is the number of patients admitted in each department referral category?

select department_referral,
       count(case when admission_flag = 'Admission' then 1 end) as total_admitted_patients
from healthcare
group by department_referral
order by total_admitted_patients desc;


-- Q.20 What is the admission rate for each department referral category?

select department_referral,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as admission_rate
from healthcare
group by department_referral
order by admission_rate desc;

-- Q.21 What is the average patient wait time by gender and admission status?

select gender,
       admission_flag,
	   round(avg(wait_time) ,2) as avg_wait_time
from healthcare
group by gender,admission_flag
order by avg_wait_time desc;


-- Q.22 What is the average patient satisfaction score by gender and admission status?

select gender,
       admission_flag,
	   round(avg(satisfaction_score) ,2) as avg_satisfaction_score
from healthcare
group by gender,admission_flag
order by avg_satisfaction_score desc;


-- Q.23 What is the average patient wait time by age group?


select case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end as age_group ,
       round(avg(wait_time),2) as avg_wait_time
from healthcare
group by case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end 
order by avg_wait_time desc;
	   

-- Q.24 What is the average patient satisfaction score by age group?

select case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end as age_group ,
       round(avg(satisfaction_score),2) as avg_satisfaction_score
from healthcare
group by case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end 
order by avg_satisfaction_score desc;


-- Q.25 What is the admission rate for each age group?

select case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end as age_group ,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as admission_rate
from healthcare
group by case
            when age between 1 and 17 then '1-17'
			when age between 18 and 35 then '18-35'
			when age between 36 and 55 then '36-55'
			when age between 56 and 79 then '56-79'
			end 
order by admission_rate desc;


-- Q.26 Which department referral category has the highest average patient wait time?

select department_referral,
       round(avg(wait_time) ,2) as highest_avg_wait_time
from healthcare
group by department_referral
order by highest_avg_wait_time desc
limit 1;

-- Q.27 Which department referral category has the lowest average patient satisfaction score?

select department_referral,
       round(avg(satisfaction_score) ,2) as lowest_satisfaction_score
from healthcare
group by department_referral
order by lowest_satisfaction_score
limit 1;

-- Q.28 Which department referral category has the highest average patient satisfaction score?

select department_referral,
       round(avg(satisfaction_score) ,2) as highest_satisfaction_score
from healthcare
group by department_referral
order by highest_satisfaction_score desc
limit 1;

-- Q.29 Which department referral category has the highest admission rate?

select department_referral,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as highest_admission_rate
from healthcare
group  by department_referral
order by highest_admission_rate desc
limit 1;


-- Q.30 Which department referral category has the lowest admission rate?

select department_referral,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as lowest_admission_rate
from healthcare
group  by department_referral
order by lowest_admission_rate
limit 1;


-- Q.31 Which age group has the highest average patient satisfaction score?

select case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end as age_group,
	   round(avg(satisfaction_score) ,2) as highest_satisfaction_score
from healthcare
group by case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end
order by highest_satisfaction_score desc
limit 1;
	   

-- Q.32 Which age group has the lowest average patient satisfaction score?


select case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end as age_group,
	   round(avg(satisfaction_score) ,2) as lowest_satisfaction_score
from healthcare
group by case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end
order by lowest_satisfaction_score 
limit 1;

-- Q.33 Which age group has the highest admission rate?

select case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end as age_group,
	   round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as highest_admission_rate
from healthcare
group by case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end
order by highest_admission_rate desc
limit 1;

-- Q.34 Which age group has the lowest admission rate?

select case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end as age_group,
	   round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as lowest_admission_rate
from healthcare
group by case 
	   when age between 1 and 17 then '1-17'
	   when age between 18 and 35 then '18-35'
	   when age between 36 and 55 then '36-55'
	   when age between 56 and 79 then '56-79'
	   end
order by lowest_admission_rate 
limit 1;

-- Q.35 Which month had the highest number of patient admissions?

select DATE_TRUNC('month', admission_date) as month,
       count(patient_id) as highest_number_of_patient
from healthcare
where admission_flag = 'Admission'
group by DATE_TRUNC('month', admission_date)
order by  highest_number_of_patient desc
limit 1;

-- Q.36 Which month had the lowest number of patient admissions?

select DATE_TRUNC('month', admission_date) as month,
       count(patient_id) as lowest_number_of_patient
from healthcare
where admission_flag = 'Admission'
group by DATE_TRUNC('month', admission_date)
order by lowest_number_of_patient 
limit 1;


-- Q.37 Which month had the highest overall patient volume, regardless of admission status?

select DATE_TRUNC('month', admission_date) as month,
       count(patient_id) as total_patient
from healthcare
group by DATE_TRUNC('month', admission_date)
order by total_patient desc
limit 1;

-- Q.38 Which month had the lowest overall patient volume, including both admitted and not-admitted patients?

select DATE_TRUNC('month', admission_date) as month,
       count(patient_id) as total_patient
from healthcare
group by DATE_TRUNC('month', admission_date)
order by total_patient 
limit 1;       

-- Q.39 Which month had the highest average patient wait time?

select date_trunc('month', admission_date) as month,
       round(avg(wait_time) ,2) as highest_avg_wait_time
from healthcare
group by date_trunc('month', admission_date)
order by highest_avg_wait_time desc
limit 1;

-- Q.40 Which month had the lowest average patient wait time?

select date_trunc('month', admission_date) as month,
       round(avg(wait_time) ,2) as lowest_avg_wait_time
from healthcare
group by date_trunc('month', admission_date)
order by lowest_avg_wait_time 
limit 1;

-- Q.41 Which month had the highest average patient satisfaction score?

select date_trunc('month', admission_date) as month,
       round(avg(satisfaction_score) ,2) as highest_avg_satisfaction_score
from healthcare
group by date_trunc('month', admission_date)
order by highest_avg_satisfaction_score desc 
limit 1;

-- Q.42 Which month had the lowest average patient satisfaction score?

select date_trunc('month', admission_date) as month,
       round(avg(satisfaction_score) ,2) as lowest_avg_satisfaction_score
from healthcare
group by date_trunc('month', admission_date)
order by lowest_avg_satisfaction_score  
limit 1;


-- Q.43 Which month had the highest admission rate?

select date_trunc('month', admission_date) as month,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as highest_admission_rate
from healthcare
group by date_trunc('month', admission_date)
order by highest_admission_rate desc  
limit 1;


-- Q.44 Which month had the lowest admission rate?

select date_trunc('month', admission_date) as month,
       round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id) ,2) as lowest_admission_rate
from healthcare
group by date_trunc('month', admission_date)
order by lowest_admission_rate   
limit 1;

-- Q.45 Which department referral category has the highest patient volume and what percentage of all patients does it represent?

select department_referral,
       count(patient_id) as total_patients,
	   round(count(patient_id)*100.0/(select count(*) from healthcare) ,2) as percentage_of_patient
from healthcare
group by department_referral
order by total_patients desc
limit 1;

-- Q.46 Which department referral category has the highest number of admitted patients, and what is its admission rate?

select department_referral,
       count(case when admission_flag = 'Admission' then 1 end) as admitted_patients,
	   round(count(case when admission_flag = 'Admission' then 1 end)*100.0/count(patient_id),2) as admission_rate
from healthcare
group by department_referral
order by admitted_patients desc
limit 1;


-- Q.47 Which department referral category has the highest number of patients with recorded satisfaction scores?

select department_referral,
       count(patient_id) as total_patients,
	   count(satisfaction_score) as recorded_satisfaction_score
from healthcare
group by department_referral
order by recorded_satisfaction_score desc
limit 1;


-- Q.48 What percentage of patients in each department referral category have a recorded satisfaction score ?

SELECT 
    department_referral,
    COUNT(satisfaction_score) AS recorded_satisfaction_score,
    ROUND(
        COUNT(satisfaction_score) * 100.0 / COUNT(patient_id),
        2
    ) AS satisfaction_score_coverage
FROM healthcare
GROUP BY department_referral
ORDER BY satisfaction_score_coverage DESC;

-- Q.49 Which department referral category has the highest satisfaction score coverage?

SELECT 
    department_referral,
    ROUND(
        COUNT(satisfaction_score) * 100.0 / COUNT(patient_id),
        2
    ) AS satisfaction_score_coverage
FROM healthcare
GROUP BY department_referral
ORDER BY satisfaction_score_coverage DESC
LIMIT 1;

-- Q.50 What percentage of the entire patient dataset has a recorded satisfaction score?

SELECT
    ROUND(
        COUNT(satisfaction_score) * 100.0 / COUNT(patient_id),
        2
    ) AS percent_of_satisfaction_score
FROM healthcare;





































































































































