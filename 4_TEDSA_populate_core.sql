-- transform staging (tedsa_puf_2023) into  normalized tables

USE teds;

DELETE FROM admission_substance;
DELETE FROM admission;

SELECT 
    COUNT(*) AS staging_rows,
    COUNT(DISTINCT CASEID) AS distinct_ids,
    SUM(CASEID IS NULL OR CASEID = '') AS blank_ids
FROM
    tedsa_puf_2023;

INSERT INTO admission (
  caseid, admit_year, stfips, region_code, age_code, sex_code,
  race_code, ethnic_code, service_code, psource_code, methuse,
  psyprob, idu, num_prior_episodes, days_waited, alcdrug
)
SELECT
  CASEID,
  NULLIF(ADMYR,    -9),
  NULLIF(STFIPS,   -9),
  NULLIF(REGION,   -9),
  NULLIF(AGE,      -9),
  NULLIF(SEX,      -9),
  NULLIF(RACE,     -9),
  NULLIF(ETHNIC,   -9),
  NULLIF(SERVICES, -9),
  NULLIF(PSOURCE,  -9),
  NULLIF(METHUSE,  -9),
  NULLIF(PSYPROB,  -9),
  NULLIF(IDU,      -9),
  NULLIF(NOPRIOR,  -9),
  NULLIF(DAYWAIT,  -9),
  NULLIF(ALCDRUG,  -9)
FROM tedsa_puf_2023
WHERE CASEID IS NOT NULL AND CASEID <> '';


INSERT INTO admission_substance (caseid, sub_rank, sub_code, route_code, freq_code, first_use_age)
SELECT CASEID, 1, SUB1, NULLIF(ROUTE1,-9), NULLIF(FREQ1,-9), NULLIF(FRSTUSE1,-9)
FROM tedsa_puf_2023
WHERE SUB1 NOT IN (-9, 1) AND CASEID IS NOT NULL AND CASEID <> '';

INSERT INTO admission_substance (caseid, sub_rank, sub_code, route_code, freq_code, first_use_age)
SELECT CASEID, 2, SUB2, NULLIF(ROUTE2,-9), NULLIF(FREQ2,-9), NULLIF(FRSTUSE2,-9)
FROM tedsa_puf_2023
WHERE SUB2 NOT IN (-9, 1) AND CASEID IS NOT NULL AND CASEID <> '';

INSERT INTO admission_substance (caseid, sub_rank, sub_code, route_code, freq_code, first_use_age)
SELECT CASEID, 3, SUB3, NULLIF(ROUTE3,-9), NULLIF(FREQ3,-9), NULLIF(FRSTUSE3,-9)
FROM tedsa_puf_2023
WHERE SUB3 NOT IN (-9, 1) AND CASEID IS NOT NULL AND CASEID <> '';


SELECT 
    (SELECT 
            COUNT(*)
        FROM
            admission) AS admission_rows,
    (SELECT 
            COUNT(*)
        FROM
            admission_substance) AS substance_rows;
