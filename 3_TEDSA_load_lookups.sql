-- populate lookup tables from the teds-a codebook (2023)

USE teds;

INSERT INTO state (stfips, state_name) VALUES
 (1,'Alabama'),(2,'Alaska'),(4,'Arizona'),(5,'Arkansas'),(6,'California'),
 (8,'Colorado'),(9,'Connecticut'),(10,'Delaware'),(11,'District of Columbia'),
 (12,'Florida'),(13,'Georgia'),(15,'Hawaii'),(16,'Idaho'),(17,'Illinois'),
 (18,'Indiana'),(19,'Iowa'),(20,'Kansas'),(21,'Kentucky'),(22,'Louisiana'),
 (23,'Maine'),(24,'Maryland'),(25,'Massachusetts'),(26,'Michigan'),
 (27,'Minnesota'),(28,'Mississippi'),(29,'Missouri'),(30,'Montana'),
 (31,'Nebraska'),(32,'Nevada'),(33,'New Hampshire'),(34,'New Jersey'),
 (35,'New Mexico'),(36,'New York'),(37,'North Carolina'),(38,'North Dakota'),
 (39,'Ohio'),(40,'Oklahoma'),(41,'Oregon'),(42,'Pennsylvania'),
 (44,'Rhode Island'),(45,'South Carolina'),(46,'South Dakota'),
 (47,'Tennessee'),(48,'Texas'),(49,'Utah'),(50,'Vermont'),(51,'Virginia'),
 (53,'Washington'),(54,'West Virginia'),(55,'Wisconsin'),(56,'Wyoming'),
 (72,'Puerto Rico');

INSERT INTO region (region_code, region_name) VALUES
 (0,'U.S. territories'),
 (1,'Northeast'),(2,'Midwest'),(3,'South'),(4,'West');

INSERT INTO age_group (age_code, age_label) VALUES
 (1,'12-14'),(2,'15-17'),(3,'18-20'),(4,'21-24'),(5,'25-29'),
 (6,'30-34'),(7,'35-39'),(8,'40-44'),(9,'45-49'),(10,'50-54'),
 (11,'55-64'),(12,'65 and older');

INSERT INTO sex (sex_code, sex_label) VALUES
 (1,'Male'),(2,'Female');

INSERT INTO race (race_code, race_label) VALUES
 (1,'Alaska Native'),(2,'American Indian'),
 (3,'Asian or Pacific Islander'),(4,'Black or African American'),
 (5,'White'),(6,'Asian'),(7,'Other single race'),
 (8,'Two or more races'),(9,'Native Hawaiian / Other Pacific Islander');

INSERT INTO ethnicity (ethnic_code, ethnic_label) VALUES
 (1,'Puerto Rican'),(2,'Mexican'),(3,'Cuban or other specific Hispanic'),
 (4,'Not of Hispanic origin'),(5,'Hispanic, origin not specified');

INSERT INTO substance (sub_code, sub_name, sub_category) VALUES
 (1,'None','None'),
 (2,'Alcohol','Depressant'),
 (3,'Cocaine / crack','Stimulant'),
 (4,'Marijuana / hashish','Cannabis'),
 (5,'Heroin','Opioid'),
 (6,'Non-prescription methadone','Opioid'),
 (7,'Other opiates and synthetics','Opioid'),
 (8,'PCP','Hallucinogen'),
 (9,'Hallucinogens','Hallucinogen'),
 (10,'Methamphetamine / speed','Stimulant'),
 (11,'Other amphetamines','Stimulant'),
 (12,'Other stimulants','Stimulant'),
 (13,'Benzodiazepines','Depressant'),
 (14,'Other tranquilizers','Depressant'),
 (15,'Barbiturates','Depressant'),
 (16,'Other sedatives or hypnotics','Depressant'),
 (17,'Inhalants','Inhalant'),
 (18,'Over-the-counter medications','Other'),
 (19,'Other drugs','Other');

INSERT INTO route_of_admin (route_code, route_label) VALUES
 (1,'Oral'),(2,'Smoking'),(3,'Inhalation'),
 (4,'Injection (IV/IM)'),(5,'Other');

INSERT INTO use_frequency (freq_code, freq_label) VALUES
 (1,'No use in past month'),(2,'Some use'),(3,'Daily use');

INSERT INTO service_type (service_code, service_label) VALUES
 (1,'Detox, 24-hour, hospital inpatient'),
 (2,'Detox, 24-hour, free-standing residential'),
 (3,'Rehab/residential, hospital (non-detox)'),
 (4,'Rehab/residential, short term (<=30 days)'),
 (5,'Rehab/residential, long term (>30 days)'),
 (6,'Ambulatory, intensive outpatient'),
 (7,'Ambulatory, non-intensive outpatient'),
 (8,'Ambulatory, detoxification');

INSERT INTO referral_source (psource_code, psource_label) VALUES
 (1,'Individual (includes self-referral)'),
 (2,'Alcohol/drug use care provider'),
 (3,'Other health care provider'),
 (4,'School (educational)'),
 (5,'Employer / EAP'),
 (6,'Other community referral'),
 (7,'Court / criminal justice referral');

INSERT INTO alcdrug_type (alcdrug_code, alcdrug_label) VALUES
 (0,'None'),
 (1,'Alcohol only'),
 (2,'Other drugs only'),
 (3,'Alcohol and other drugs');
 
