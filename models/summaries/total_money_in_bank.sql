{{ config(
    materialized = 'table',
)}}

SELECT SUM(balance) 
AS total_money
FROM {{ ref('customers')}}
