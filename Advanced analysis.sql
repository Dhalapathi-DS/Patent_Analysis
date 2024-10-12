/*Advanced analysis*/
/*count of patent with priority claims*/
SELECT 
    COUNT(DISTINCT PriorityNumber) AS Unique_Priority_Numbers
FROM 
    `patent.patents`
WHERE 
    PriorityNumber IS NOT NULL
/*priority claims by country*/
SELECT 
    PriorityCountry, 
    COUNT(*) AS Total_Priority_Claims
FROM 
    `patent.patents`
WHERE 
    PriorityCountry IS NOT NULL
GROUP BY 
    PriorityCountry
ORDER BY 
    Total_Priority_Claims DESC;
/*Inventor and applicant analysis*/
/*profilic inventors*/
SELECT 
    InventorName, 
    COUNT(*) AS Total_Patents
FROM 
    `patent.patents`
where InventorName is not null
GROUP BY 
    InventorName
ORDER BY 
    Total_Patents DESC
LIMIT 10
/*profilic applicants*/
SELECT 
    ApplicantName, 
    COUNT(*) AS Total_Patents
FROM 
    `patent.patents`
GROUP BY 
    ApplicantName
ORDER BY 
    Total_Patents DESC
LIMIT 10;
/*Examination and grant analysis*/
/*Time from application to grant*/
SELECT 
    ApplicationNumber,
    DATE_DIFF(DateOfCertificateIssue, ApplicationFilingDate,day) AS Days_To_Grant
FROM 
    `patent.patents`
WHERE 
    DateOfCertificateIssue IS NOT NULL
ORDER BY 
    Days_To_Grant ASC
/*Average time from application to grant*/
SELECT 
    Status, 
    AVG(DATE_DIFF(DateOfCertificateIssue, ApplicationFilingDate, DAY)) AS Avg_Days_To_Grant,
    MIN(DATE_DIFF(DateOfCertificateIssue, ApplicationFilingDate, DAY)) AS Min_Days,
    MAX(DATE_DIFF(DateOfCertificateIssue, ApplicationFilingDate, DAY)) AS Max_Days
FROM 
    `patent.patents`
WHERE 
    DateOfCertificateIssue IS NOT NULL
    AND ApplicationFilingDate IS NOT NULL
GROUP BY 
    Status;
/*Time from Filing to Publication*/
SELECT 
    Status, 
    AVG(DATE_DIFF(PublicationDate, ApplicationFilingDate, DAY)) AS Avg_Days_To_Publication,
    COUNT(*) AS Total_Applications
FROM 
    `patent.patents`
WHERE 
    PublicationDate IS NOT NULL
    AND ApplicationFilingDate IS NOT NULL
GROUP BY 
    Status
ORDER BY 
    Avg_Days_To_Publication ASC;





