SELECT SUBSTR(Grant_or_Publication_Date, 0, 4) AS year, SUBSTR(Grant_or_Publication_Date, 5, 2) AS month, COUNT(Patent_Title)
FROM patents-public-data.uspto_oce_cancer.publications
WHERE
  CAST(SUBSTR(Grant_or_Publication_Date, 0, 4) AS INT64) BETWEEN 2012 AND 2023
  AND LOWER(Patent_Title) LIKE '%data mining%'
GROUP BY year, month
ORDER BY year DESC, month ASC