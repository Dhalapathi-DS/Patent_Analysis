/*Data cleaning process*/
/*1.Identify missing values*/

SELECT 
    COUNT(*) - COUNT(ApplicationNumber) AS Missing_ApplicationNumber,
    COUNT(*) - COUNT(Title) AS Missing_Title,
    COUNT(*) - COUNT(ApplicationDate) AS Missing_ApplicationDate,
    COUNT(*) - COUNT(Status) AS Missing_Status,
    COUNT(*) - COUNT(PublicationNumber) AS Missing_PublicationNumber,
FROM 
    `patent.patents`
/*2.Identify duplicates*/
SELECT 
    ApplicationNumber, 
    Title, 
    COUNT(*) AS DuplicateCount
FROM 
    patent_data
GROUP BY 
    ApplicationNumber, Title
HAVING 
    COUNT(*) > 1
