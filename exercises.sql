-- #1
SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") AS earliest_date 
FROM users;
+---------------+
| earliest_date |
+---------------+
| May 2nd 2016  |
+---------------+

-- #2
SELECT *
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);
+-----------------------------+---------------------+
| email                       | created_at          |
+-----------------------------+---------------------+
| Friedrich_Kulas@hotmail.com | 2016-05-02 20:28:18 |
+-----------------------------+---------------------+

-- #3
SELECT 
    MONTHNAME(created_at)  AS month,
    COUNT(*) AS count
 FROM users GROUP BY month
ORDER BY count DESC;
+-----------+-------+
| month     | count |
+-----------+-------+
| November  |    51 |
| January   |    49 |
| May       |    48 |
| December  |    47 |
| July      |    46 |
| June      |    43 |
| April     |    41 |
| October   |    41 |
| September |    40 |
| March     |    40 |
| August    |    40 |
| February  |    32 |
+-----------+-------+

-- #4
SELECT COUNT(*) AS yahoo_users FROM users
WHERE email LIKE '%@yahoo.com';
+-------------+
| yahoo_users |
+-------------+
|         166 |
+-------------+

-- #5
SELECT
    CASE
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
+----------+-------------+
| provider | total_users |
+----------+-------------+
| gmail    |         190 |
| yahoo    |         166 |
| hotmail  |         159 |
| other    |           3 |
+----------+-------------+
