{{ config(
    materialized = 'table',
)}}

SELECT customerid, estimatedsalary FROM 
{{ ref('customers') }}
ORDER BY estimatedsalary DESC