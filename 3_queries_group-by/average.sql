SELECT students.name AS student, AVG(duration) AS duration_average
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY duration_average DESC
