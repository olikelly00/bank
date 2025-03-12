{{ config(
    materialized = 'table',
)}}

SELECT cardtype, COUNT(customerid) AS customercount
FROM {{ ref('customers')}}
GROUP BY cardtype
ORDER BY customercount

-- Test that the number of cards =10000?