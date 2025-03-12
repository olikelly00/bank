{{ config(
    materialized = 'table',
)}}

SELECT cardtype, COUNT(customerid) AS rich_customercount
FROM {{ ref('customers')}}
WHERE balance > (SELECT MAX(balance)  FROM {{ ref('customers') }}) * 0.75
GROUP BY cardtype
