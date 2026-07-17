# Introduction

This project utilizes the 2023 Treatment Episode Data Set Admissions (TEDS-A) by the Substance Abuse and Mental Health Services Administration (SAMHSA). This is a national dataset that compiles state records on patient admissions to publicly-funded substance treatment facilities, which includes information about patient characteristics, information regarding the substances they used, and records what is known about their pathway to treatment.
The database is built around one main admissions table, with each row representing a single instance of an individual being admitted for treatment (thus, each row represents one instance of admission, not necessarily a unique individual person. If someone enters treatment multiple times, their information will appear in the data again). The original data file stores most information as numeric codes, for which I constructed tables that link by foreign key from the admissions table to translate those codes into readable labels using the public TEDS-A codebook (e.g. for state codes, 1 = Alabama, 2 = Alaska, etc.). Of all the information available in the dataset, I opted to focus on three main patient demographic variables (race, age, and co-occurring psychiatric condition), the states in which they were admitted for treatment, and details about what substances their admission involved and how they were referred to treatment.

---

# Database design (Entity Relationship Diagram

<img width="1357" height="888" alt="TEDSA_EERD" src="https://github.com/user-attachments/assets/25fed8ba-e5ab-4636-83c0-528360c606b8" />

---

# Query results

How many treatment admissions are there by race?

<img width="49%" alt="image" src="https://github.com/user-attachments/assets/f4b70b6a-a489-4d7f-a7b1-08df67fb3548" />


What substances most frequently result in admission for treatment and what category do they belong to?

<img width="49%" alt="image" src="https://github.com/user-attachments/assets/320a0390-2bc3-4714-96b3-78f165e55a3e" />


For each drug category of primary substance associated with admission, how many/what rate of individuals reported a co-occurring psychiatric condition?

<img width="55%" src="https://github.com/user-attachments/assets/60210bbd-9918-4c88-86ee-01112157423b" />

---

# Conclusion

The database developed for this project has potential for further research into identifying target populations for substance use initiatives and developing large-scale programs and policies to address substance use crises at multiple levels, from prevention to post-admission support systems. By diving deeper into what demographics are most at-risk for being admitted to treatment facilities for certain substances, preventative programs can be directed towards those communities. Another worthwhile way to make use of this database is by creating databases for previous years that TEDSA data was collected and identifying trends for predictive purposes, potentially yielding more insight into what we can expect of substance use crises in years to come.

---

# Citations

Substance Abuse and Mental Health Services Administration. (2025). Treatment Episode Data Set – Admissions (TEDS-A), 2023 [Data set]. U.S. Department of Health and Human Services, Substance Abuse and Mental Health Services Administration. https://www.samhsa.gov/data/data-we-collect/teds/datafiles

Substance Abuse and Mental Health Services Administration. (2025). Treatment Episode Data Set Admissions (TEDS-A), 2023: Public use file (PUF) codebook. U.S. Department of Health and Human Services. https://www.samhsa.gov/data/data-we-collect/teds/datafiles
