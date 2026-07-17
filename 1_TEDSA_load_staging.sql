-- =====================================================================
-- 01_load_staging.sql
-- STEP 1: Create the database and load the raw delimited TEDS-A file
--         into a flat "staging" table, exactly as it comes from SAMHSA.
-- =====================================================================
-- We load the raw file UNCHANGED first (one wide table of numeric codes),
-- then normalize it into a proper schema in later scripts. This is the
-- standard "staging -> transform" pattern and keeps the messy import step
-- separate from your clean design.
-- =====================================================================

DROP DATABASE IF EXISTS teds;
CREATE DATABASE teds;
USE teds;


DROP TABLE IF EXISTS tedsa_puf_2023;
CREATE TABLE tedsa_puf_2023 (
  ADMYR    INT,
  CASEID   VARCHAR(20),
  STFIPS   INT,
  EDUC     INT,
  MARSTAT  INT,
  SERVICES INT,
  DETCRIM  INT,
  NOPRIOR  INT,
  PSOURCE  INT,
  ARRESTS  INT,
  EMPLOY   INT,
  METHUSE  INT,
  PSYPROB  INT,
  PREG     INT,
  SEX      INT,
  VET      INT,
  LIVARAG  INT,
  DAYWAIT  INT,
  DSMCRIT  INT,
  AGE      INT,
  RACE     INT,
  ETHNIC   INT,
  DETNLF   INT,
  PRIMINC  INT,
  SUB1     INT,
  SUB2     INT,
  SUB3     INT,
  ROUTE1   INT,
  ROUTE2   INT,
  ROUTE3   INT,
  FREQ1    INT,
  FREQ2    INT,
  FREQ3    INT,
  FRSTUSE1 INT,
  FRSTUSE2 INT,
  FRSTUSE3 INT,
  HLTHINS  INT,
  PRIMPAY  INT,
  FREQ_ATND_SELF_HELP INT,
  ALCFLG   INT,
  COKEFLG  INT,
  MARFLG   INT,
  HERFLG   INT,
  METHFLG  INT,
  OPSYNFLG INT,
  PCPFLG   INT,
  HALLFLG  INT,
  MTHAMFLG INT,
  AMPHFLG  INT,
  STIMFLG  INT,
  BENZFLG  INT,
  TRNQFLG  INT,
  BARBFLG  INT,
  SEDHPFLG INT,
  INHFLG   INT,
  OTCFLG   INT,
  OTHERFLG INT,
  DIVISION INT,
  REGION   INT,
  IDU      INT,
  ALCDRUG  INT,
  CBSA2020 INT
);

-- locate directory MySQL is allowed to read from:
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tedsa_puf_2023.csv"
INTO TABLE tedsa_puf_2023
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- check proper row load
SELECT COUNT(*) FROM tedsa_puf_2023;
SELECT COUNT(DISTINCT stfips) FROM tedsa_puf_2023;
