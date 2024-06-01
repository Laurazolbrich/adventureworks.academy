WITH dates AS (
    SELECT 
        DATEADD(DAY, SEQ4(), '2011-05-31') AS full_date,
        EXTRACT(DAY FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS day,
        EXTRACT(MONTH FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS month,
        EXTRACT(YEAR FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS year,
        DAYNAME(DATEADD(DAY, SEQ4(), '2011-05-31')) AS day_of_week_name,
        EXTRACT(DAYOFWEEK FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS day_of_week_number,
        EXTRACT(WEEK FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS week_of_year,
        EXTRACT(QUARTER FROM DATEADD(DAY, SEQ4(), '2011-05-31')) AS quarter
    FROM TABLE(GENERATOR(ROWCOUNT => 1132))  -- Gera 1132 dias de '2011-05-31' até '2014-06-30'
)
SELECT
    full_date,
    day,
    month,
    year,
    day_of_week_name,
    day_of_week_number,
    week_of_year,
    quarter
FROM dates
WHERE full_date <= '2014-06-30'