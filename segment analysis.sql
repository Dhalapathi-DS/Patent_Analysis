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
    TRIM(country) AS country, 
    COUNT(*) AS total_patents
FROM (
    SELECT 
        TRIM(country) AS country
    FROM 
        `patent.patents`,
        UNNEST(SPLIT(REPLACE(ApplicantCountry, '#', ','), ',')) AS country
)
WHERE 
    country IS NOT NULL AND country != ''  -- Exclude NULL and empty string values
GROUP BY 
    country
ORDER BY 
    total_patents DESC;

/*Segment Analysis by Classification (IPC)*/
SELECT 
    CASE 
        WHEN Classification_IPC LIKE 'A%' THEN 'A — Human Necessities'
        WHEN Classification_IPC LIKE 'B%' THEN 'B — Performing Operations; Transporting'
        WHEN Classification_IPC LIKE 'C%' THEN 'C — Chemistry; Metallurgy'
        WHEN Classification_IPC LIKE 'D%' THEN 'D — Textiles; Paper'
        WHEN Classification_IPC LIKE 'E%' THEN 'E — Fixed Constructions'
        WHEN Classification_IPC LIKE 'F%' THEN 'F — Mechanical Engineering; Lighting; Heating; Weapons; Blasting'
        WHEN Classification_IPC LIKE 'G%' THEN 'G — Physics'
        WHEN Classification_IPC LIKE 'H%' THEN 'H — Electricity'
        ELSE 'Others' 
    END AS IPC_Category,
    COUNT(*) AS Count
FROM 
    `patent.patents` -- Replace with your actual table name
GROUP BY 
    IPC_Category
ORDER BY 
    IPC_Category;


