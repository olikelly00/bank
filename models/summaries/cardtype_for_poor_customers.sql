{{ config(
    materialized = 'table',
)}}

SELECT cardtype, 
COUNT(customerid) AS poor_customercount
FROM {{ ref('customers')}}
WHERE balance < (SELECT MAX(balance)  FROM {{ ref('customers') }}) * 0.25
GROUP BY cardtype

