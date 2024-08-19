/*Patents by Applicant Country*/
SELECT 
    ApplicantCountry, 
    COUNT(*) AS Total_Patents
FROM 
    `patent.patents`
GROUP BY 
    ApplicantCountry
ORDER BY 
    Total_Patents DESC;
/*Patents by Inventor Country*/
SELECT 
    InventorCountry, 
    COUNT(*) AS Total_Patents
FROM 
    `patent.patents`
GROUP BY 
    InventorCountry
ORDER BY 
    Total_Patents DESC;
/*Segment Analysis by Classification (IPC)*/
SELECT 
    Classification_IPC, 
    COUNT(*) AS Total_Patents
FROM 
    `patent.patents`
GROUP BY 
    Classification_IPC
ORDER BY 
    Total_Patents DESC;

