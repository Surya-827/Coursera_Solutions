SELECT
    p.sku,p.product_name
FROM
    product p
LEFT JOIN
    invoice_item ii
ON
    p.id = ii.product_id
WHERE
    ii.product_id IS NULL
ORDER BY
    p.sku ASC;