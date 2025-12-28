WITH ranked_records AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY
                business_id,
                entity_id,
                transaction_date,
                amount
            ORDER BY last_updated_ts DESC
        ) AS rn
    FROM source_table
)

SELECT
    *
FROM ranked_records
WHERE rn = 1;
