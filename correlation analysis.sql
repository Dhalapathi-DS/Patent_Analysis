/*Correlation Between Number of Patents by Inventor and Grant Status*/
WITH InventorPatentCount AS (
    SELECT 
        InventorName,
        COUNT(DISTINCT ApplicationNumber) AS Total_Patents
    FROM 
        `patent.patents`
    GROUP BY 
        InventorName
)
SELECT 
    ipc.InventorName,
    ipc.Total_Patents,
    AVG(CASE WHEN pd.Status = 'Granted' THEN 1 ELSE 0 END) AS Grant_Rate
FROM 
    InventorPatentCount ipc
JOIN 
    `patent.patents` pd ON ipc.InventorName = pd.InventorName
GROUP BY 
    ipc.InventorName, ipc.Total_Patents
ORDER BY 
    Grant_Rate DESC

