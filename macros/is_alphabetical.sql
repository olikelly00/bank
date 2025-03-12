{% test is_alphabetical(model, column_name) %}

SELECT 
    COUNT(*) AS invalid_rows
FROM {{ model }}
WHERE {{ column_name }} !~ '^[A-Za-z ]+$'
HAVING COUNT(*) > 0 

{% endtest %}

