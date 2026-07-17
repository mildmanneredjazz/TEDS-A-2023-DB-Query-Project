-- checks before writing queries

USE teds;

-- row counts; staging_rows should be 1 million + rows
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            tedsa_puf_2023) AS staging_rows,
    (SELECT 
            COUNT(*)
        FROM
            admission) AS admission_rows,
    (SELECT 
            COUNT(*)
        FROM
            admission_substance) AS substance_rows;

-- count distinct states
SELECT 
    COUNT(DISTINCT stfips) AS distinct_states
FROM
    admission;

-- should return 0 rows with substance code missing a label
SELECT DISTINCT
    a.sub_code
FROM
    admission_substance a
        LEFT JOIN
    substance s ON s.sub_code = a.sub_code
WHERE
    s.sub_code IS NULL;

-- should return 0 orphan substance rows (proving foreign key is satisfied)
SELECT 
    COUNT(*) AS orphan_substance_rows
FROM
    admission_substance asu
        LEFT JOIN
    admission a ON a.caseid = asu.caseid
WHERE
    a.caseid IS NULL;

-- spot-check a decoded admission with its substances
SELECT 
    a.caseid,
    st.state_name,
    ag.age_label,
    sx.sex_label,
    sv.service_label,
    s.sub_name,
    asu.sub_rank
FROM
    admission a
        JOIN
    state st ON st.stfips = a.stfips
        JOIN
    age_group ag ON ag.age_code = a.age_code
        JOIN
    sex sx ON sx.sex_code = a.sex_code
        JOIN
    service_type sv ON sv.service_code = a.service_code
        JOIN
    admission_substance asu ON asu.caseid = a.caseid
        JOIN
    substance s ON s.sub_code = asu.sub_code
ORDER BY a.caseid , asu.sub_rank
LIMIT 20;
