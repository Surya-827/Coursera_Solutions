WITH time_diff AS (
    SELECT
        emp_id,
        CAST(TIMESTAMP AS DATE) AS work_date,
        TIMESTAMP,
        LAG(TIMESTAMP) OVER (PARTITION BY emp_id, CAST(TIMESTAMP AS DATE) ORDER BY TIMESTAMP) AS prev_timestamp
    FROM attendance
    WHERE WEEKDAY(TIMESTAMP) IN (5, 6) -- MySQL: Saturday = 5, Sunday = 6
),
hours_worked AS (
    SELECT
        emp_id,
        TIMESTAMPDIFF(HOUR, prev_timestamp, TIMESTAMP) AS hours
    FROM time_diff
    WHERE prev_timestamp IS NOT NULL
)
SELECT
    emp_id,
    SUM(hours) AS total_weekend_hours
FROM hours_worked
GROUP BY emp_id
ORDER BY total_weekend_hours DESC;
