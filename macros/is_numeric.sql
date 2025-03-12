{% test is_numeric(model, column_name) %}

SELECT 
    COUNT(*) AS invalid_rows
FROM {{ model }}
WHERE {{ column_name }}::TEXT !~ '^[0-9]+$'
HAVING COUNT(*) > 0 

{% endtest %}