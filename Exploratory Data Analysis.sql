/*Exploratory Data Analysis (EDA)*/
/*Summary Statistics: Use SQL to calculate basic statistics (e.g., COUNT, AVG, MIN, MAX) for various fields*/
/*Count of Patents*/
SELECT COUNT(*) AS total_patents FROM patents;
/*Average Time Between Application and Publication*/
SELECT AVG(DATE_DIFF(PublicationDate, ApplicationFilingDate, DAY)) AS avg_time_to_publication
FROM `patent.patents`
/*Minimum and Maximum Application Date*/
SELECT MIN(ApplicationDate) AS earliest_application, 
       MAX(ApplicationDate) AS latest_application
FROM `patent.patents`
/*Distribution of Application Status*/
SELECT Application_Status, COUNT(*) AS status_count
FROM `patent.patents`
GROUP BY Application_Status
ORDER BY status_count DESC

