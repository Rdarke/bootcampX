SELECT name, email, phone
FROM students
WHERE end_date IS NOT null
AND github IS null
ORDER BY name;