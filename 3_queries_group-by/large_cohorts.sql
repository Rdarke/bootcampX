SELECT cohorts.name AS cohort_name, 
COUNT(*) AS student_count
FROM students
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING COUNT(*) >= 18
ORDER BY COUNT(*);