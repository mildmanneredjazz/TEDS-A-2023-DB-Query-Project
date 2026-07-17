-- Notes for clarity:
-- Each instance in the parent dataset (SAMHSA Treatment Episode Data Set (Admissions)) represents
-- a single admission of a patient for treatment; if the same individual is admitted multiple times,
-- they will appear as a new instance in the table
-- "sub_rank = 1" denotes the primary substance a patient was admitted (data records up to 
-- three substances they may have been using)

USE teds;
 
-- 1. How many treatment admissions are there by race?
SELECT 
    rc.race_label, COUNT(*) AS admissions
FROM
    admission a
        JOIN
    race rc ON rc.race_code = a.race_code
GROUP BY rc.race_label
ORDER BY admissions DESC;


-- 2. What age groups constitute the most treatment admissions (in descending order)?
SELECT 
    ag.age_label, COUNT(*) AS admissions
FROM
    admission a
        JOIN
    age_group ag ON ag.age_code = a.age_code
GROUP BY ag.age_label
ORDER BY total DESC;

-- 3. What substances most frequently result in admission for treatment and what category do
-- they belong to? (e.g. depressant, stimulant, opioid, etc.)
SELECT 
    s.sub_name, s.sub_category, COUNT(*) AS admissions
FROM
    admission_substance asub
        JOIN
    substance s ON s.sub_code = asub.sub_code
WHERE
    asub.sub_rank = 1
GROUP BY s.sub_name , s.sub_category
ORDER BY admissions DESC;

-- 4.Which states report the most admissions for treatment for all substances?
SELECT 
    st.state_name, COUNT(*) AS admissions
FROM
    admission a
        JOIN
    state st ON st.stfips = a.stfips
GROUP BY st.state_name
ORDER BY admissions DESC;

-- 5. What are the main routes/sources of referral for admission?
SELECT 
    ps.psource_label, COUNT(*) AS admissions_total
FROM
    admission a
        JOIN
    referral_source ps ON ps.psource_code = a.psource_code
GROUP BY ps.psource_label
ORDER BY admissions DESC;

-- 6. What percent of treatment admissions report having a co-occurring psychiatric condition?
SELECT 
    COUNT(*) AS admissions,
    SUM(a.psyprob = 1) AS admissions_w_psych_condition,
    ROUND(100 * SUM(a.psyprob = 1) / COUNT(*), 1) AS percent_psych_condition
FROM
    admission a;


-- 7. For each drug category of primary substance associated with admission, how many/what percent
-- of individuals reported a co-occuring psychiatric condition?
SELECT 
    s.sub_category,
    COUNT(*) AS total_admissions,
    SUM(a.psyprob = 1) AS admissions_w_psych_condition,
    ROUND(100 * SUM(a.psyprob = 1) / COUNT(*), 1) AS percent_psych_condition
FROM
    admission a
        JOIN
    admission_substance asu ON asu.caseid = a.caseid
        JOIN
    substance s ON s.sub_code = asu.sub_code
WHERE
    asu.sub_rank = 1
GROUP BY s.sub_category
ORDER BY percent_psych_condition DESC;

-- 8. By each race, how many admissions report a co-occurring psychiatric condition?
SELECT 
    rc.race_label,
    COUNT(*) AS admissions_total,
    SUM(a.psyprob = 1) AS admissions_w_psych_condition,
    ROUND(100 * SUM(a.psyprob = 1) / COUNT(*), 1) AS percent_psych_condition
FROM
    admission a
        JOIN
    race rc ON rc.race_code = a.race_code
GROUP BY rc.race_label
ORDER BY percent_psych_condition DESC;