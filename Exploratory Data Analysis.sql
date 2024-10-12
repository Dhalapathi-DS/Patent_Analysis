/*Exploratory Data Analysis (EDA)*/
/*Summary Statistics: Use SQL to calculate basic statistics (e.g., COUNT, AVG, MIN, MAX) for various fields*/
/*Count of Patents*/
SELECT COUNT(DISTINCT ApplicationNumber) AS total_patents
FROM `patent.patents`
/*Average Time Between Application and Publication*/
SELECT AVG(DATE_DIFF(PublicationDate, ApplicationFilingDate, DAY)) AS avg_time_to_publication
FROM `patent.patents`
/*Minimum and Maximum Application Date*/
SELECT MIN(ApplicationDate) AS earliest_application, 
       MAX(ApplicationDate) AS latest_application
FROM `patent.patents`
/*Distribution of Application Status*/
SELECT 
    CASE 
        WHEN LOWER(application_status) LIKE '%granted%' THEN 'Granted'
        WHEN LOWER(application_status) LIKE '%abandoned%' THEN 'Abandoned'
        WHEN LOWER(application_status) LIKE '%application%' THEN 'Application'
        WHEN LOWER(application_status) LIKE '%withdrawn%' THEN 'Withdrawn'
        WHEN LOWER(application_status) LIKE '%reduced%' THEN 'Reduced'
        ELSE 'Other'
    END AS status_category,
    COUNT(*) AS total_count
FROM `patent.patents`
GROUP BY status_category;
/*Distribution Analysis*/
/*Distribution by Priority Country*/
SELECT PriorityCountry, COUNT(*) AS country_count
FROM `patent.patents`
where PriorityCountry is not null
GROUP BY PriorityCountry
ORDER BY country_count DESC
/*Distribution of Publication Dates*/
SELECT extract(month from PublicationDate) AS publication_month, COUNT(*) AS publication_count
FROM `patent.patents`
GROUP BY publication_month
ORDER BY publication_month




