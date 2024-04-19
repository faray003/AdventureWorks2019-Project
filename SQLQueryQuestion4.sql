SELECT JobTitle, AVG(SickLeaveHours) AS Average_SickLeaveHours
FROM HumanResources.Employee
GROUP BY JobTitle
ORDER BY Average_SickLeaveHours;

SELECT JobTitle, OrganizationLevel, AVG(SickLeaveHours) AS Average_SickLeaveHours
FROM HumanResources.Employee
WHERE OrganizationLevel IS NOT NULL
GROUP BY JobTitle, OrganizationLevel
ORDER BY OrganizationLevel;