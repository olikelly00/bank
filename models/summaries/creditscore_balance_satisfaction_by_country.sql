{{ config(
    materialized = 'table',
)}}

SELECT geography, AVG(creditscore) AS average_creditscore,
 AVG(balance) AS average_balance,
AVG(satisfactionscore) AS average_satisfactionscore
FROM {{ ref('customers') }} 
GROUP BY geography
ORDER BY geography