SELECT students.name AS student, AVG(assignment_submissions.duration) AS duration_average, AVG(assignments.duration) AS estimated_duration_average
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY duration_average;