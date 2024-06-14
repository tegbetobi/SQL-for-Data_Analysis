
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    Custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)

); 

SELECT *
FROM job_applied;


INSERT INTO job_applied (
        job_id,
        application_sent_date,
        Custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status)
        
VALUES  (
        1,'2024-02-01', true, 'resume01.pdf', true, 'cover01', 'submitted'),
        (
        2,'2024-02-02', false, 'letter.pdf',false, NULL,'interview scheduled'),
        (
        3,'2024-02-03', true, 'resume02.pdf', true,'cover03','ghosted'),
        (
        4,'2024-02-04', true, 'resume04.pdf', false, NULL,'submitted');


ALTER TABLE job_applied
    ADD contact VARCHAR(50)


UPDATE  job_applied 
SET     contact = 'Erlich Bachman'
WHERE   job_id = 1;

UPDATE  job_applied 
SET     contact = 'Dinesh Chugati'
WHERE   job_id = 2;

UPDATE  job_applied 
SET     contact = 'Jian Yang'
WHERE   job_id = 3;

UPDATE  job_applied 
SET     contact = 'Big Head'
WHERE   job_id = 4;



ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name; 

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT; 



ALTER TABLE job_applied
DROP COLUMN contact_name;



DROP TABLE job_applied


SELECT *
FROM job_applied;    


--DATETIME

SELECT *

FROM job_postings_fact

WHERE EXTRACT(MONTH FROM job_posted_date) = 1

LIMIT 50;


-- datetime creating a new table for months


CREATE TABLE january_jobs AS
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--Feb

CREATE TABLE febuary_jobs AS
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--March

CREATE TABLE march_jobs AS
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;



--CASE STATEMENTS

SELECT 
    --COUNT(job_id) AS number_of_jobs,
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

FROM job_postings_fact

LIMIT 30;

WHERE
    job_title_short = 'Data Scientist'

GROUP BY
    location_category

LIMIT 50;


-- SUBQUERIRES(A table within the table)

SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;



-- CTE(Common table expressions)

WITH company_job_count AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
from january_jobs;

-- 


SELECT *

FROM march_jobs

LIMIT 100;
