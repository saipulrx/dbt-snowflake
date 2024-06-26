WITH CTE_MY_DATE AS (
SELECT DATEADD(HOUR, SEQ4(), '2017-01-01 00:00:00') AS MY_DATE
FROM TABLE(GENERATOR(ROWCOUNT=>20000))
)
SELECT
TO_DATE(MY_DATE) as date
,TO_TIME(MY_DATE) as time
,TO_TIMESTAMP(MY_DATE) as datetime
,YEAR(MY_DATE) as year
,MONTH(MY_DATE) as month
,MONTHNAME(MY_DATE) as monthname
,DAY(MY_DATE) as day
,DAYOFWEEK(MY_DATE) as dayofweek
,WEEKOFYEAR(MY_DATE) as weekofyear
,DAYOFYEAR(MY_DATE) as dayofyear
,HOUR(MY_DATE) as hour
FROM CTE_MY_DATE