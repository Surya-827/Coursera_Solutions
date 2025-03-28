SELECT
    roll_number,
    name
FROM
    student_information a
INNER JOIN
    faculty_information b
ON
    a.advisor = b.employee_ID
WHERE
    (b.gender = 'M' and b.salary > 15000) OR (b.gender = 'F' AND b.salary > 20000);