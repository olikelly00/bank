{{
  config(
    materialized = 'table',
   )
}}

    SELECT
        customerid,
        age,
        gender,
        geography,
        balance,
        tenure,
        cardtype,
        estimatedsalary,
        creditscore,
        satisfactionscore,
        isactivemember,
        hascrcard
    FROM {{ source("raw", "raw_banking") }}
    AS customers

