-- after the staging table (tedsa_puf_2023) is loaded, create normalized schema

USE teds;

DROP TABLE IF EXISTS admission_substance;
DROP TABLE IF EXISTS admission;
DROP TABLE IF EXISTS state, region, age_group, sex, race, ethnicity,
                     substance, route_of_admin, use_frequency,
                     service_type, referral_source, alcdrug_type;

CREATE TABLE state (
    stfips INT PRIMARY KEY,
    state_name VARCHAR(40) NOT NULL
);

CREATE TABLE region (
    region_code INT PRIMARY KEY,
    region_name VARCHAR(20) NOT NULL
);

CREATE TABLE age_group (
    age_code INT PRIMARY KEY,
    age_label VARCHAR(20) NOT NULL
);

CREATE TABLE sex (
    sex_code INT PRIMARY KEY,
    sex_label VARCHAR(20) NOT NULL
);

CREATE TABLE race (
    race_code INT PRIMARY KEY,
    race_label VARCHAR(50) NOT NULL
);

CREATE TABLE ethnicity (
    ethnic_code INT PRIMARY KEY,
    ethnic_label VARCHAR(50) NOT NULL
);

CREATE TABLE substance (
    sub_code INT PRIMARY KEY,
    sub_name VARCHAR(50) NOT NULL,
    sub_category VARCHAR(30)
);

CREATE TABLE route_of_admin (
    route_code INT PRIMARY KEY,
    route_label VARCHAR(30) NOT NULL
);

CREATE TABLE use_frequency (
    freq_code INT PRIMARY KEY,
    freq_label VARCHAR(30) NOT NULL
);

CREATE TABLE service_type (
    service_code INT PRIMARY KEY,
    service_label VARCHAR(70) NOT NULL
);

CREATE TABLE referral_source (
    psource_code INT PRIMARY KEY,
    psource_label VARCHAR(60) NOT NULL
);

CREATE TABLE alcdrug_type (
    alcdrug_code INT PRIMARY KEY,
    alcdrug_label VARCHAR(40) NOT NULL
);

-- core fact table
CREATE TABLE admission (
    caseid VARCHAR(20) PRIMARY KEY,
    admit_year INT,
    stfips INT,
    region_code INT,
    age_code INT,
    sex_code INT,
    race_code INT,
    ethnic_code INT,
    service_code INT,
    psource_code INT,
    methuse INT,
    psyprob INT,
    idu INT,
    num_prior_episodes INT,
    days_waited INT,
    alcdrug INT,
    CONSTRAINT fk_adm_state FOREIGN KEY (stfips)
        REFERENCES state (stfips),
    CONSTRAINT fk_adm_region FOREIGN KEY (region_code)
        REFERENCES region (region_code),
    CONSTRAINT fk_adm_age FOREIGN KEY (age_code)
        REFERENCES age_group (age_code),
    CONSTRAINT fk_adm_sex FOREIGN KEY (sex_code)
        REFERENCES sex (sex_code),
    CONSTRAINT fk_adm_race FOREIGN KEY (race_code)
        REFERENCES race (race_code),
    CONSTRAINT fk_adm_ethnic FOREIGN KEY (ethnic_code)
        REFERENCES ethnicity (ethnic_code),
    CONSTRAINT fk_adm_service FOREIGN KEY (service_code)
        REFERENCES service_type (service_code),
    CONSTRAINT fk_adm_psource FOREIGN KEY (psource_code)
        REFERENCES referral_source (psource_code),
    CONSTRAINT fk_adm_alcdrug FOREIGN KEY (alcdrug)
        REFERENCES alcdrug_type (alcdrug_code)
);

-- many-to-many junction
CREATE TABLE admission_substance (
    caseid VARCHAR(20) NOT NULL,
    sub_rank TINYINT NOT NULL,
    sub_code INT NOT NULL,
    route_code INT,
    freq_code INT,
    first_use_age INT,
    PRIMARY KEY (caseid , sub_rank),
    CONSTRAINT fk_as_adm FOREIGN KEY (caseid)
        REFERENCES admission (caseid),
    CONSTRAINT fk_as_sub FOREIGN KEY (sub_code)
        REFERENCES substance (sub_code),
    CONSTRAINT fk_as_route FOREIGN KEY (route_code)
        REFERENCES route_of_admin (route_code),
    CONSTRAINT fk_as_freq FOREIGN KEY (freq_code)
        REFERENCES use_frequency (freq_code)
);

CREATE INDEX idx_as_sub    ON admission_substance(sub_code);
CREATE INDEX idx_adm_state ON admission(stfips);
CREATE INDEX idx_adm_age   ON admission(age_code);
