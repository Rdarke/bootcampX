const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortsName = process.argv[2] || 'JUL02';
const inputValues = [cohortsName]

const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = $1
ORDER BY teacher;
`

pool.query(queryString, inputValues)
.then(res => {
  res.rows.forEach(row => {
    console.log(`This is the user data: ${row.cohort}: ${row.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));
