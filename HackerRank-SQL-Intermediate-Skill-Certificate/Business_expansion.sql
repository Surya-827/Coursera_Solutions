SELECT
    u.id AS user_id,
    u.first_name,
    u.last_name,
    c.id AS customer_id,
    c.customer_name,
    contact_count
FROM (
    SELECT
        user_account_id,
        customer_id,
        COUNT(*) AS contact_count
    FROM contact
    GROUP BY user_account_id, customer_id
    HAVING COUNT(*) > 1
) AS cnt
JOIN user_account u ON cnt.user_account_id = u.id
JOIN customer c ON cnt.customer_id = c.id
ORDER BY u.id ASC;