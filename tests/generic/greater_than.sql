{% test greater_than(model, column_name, value) %}

with validation as (
    select
        {{ column_name }} as field_value
    from
        {{ model }}
),

validation_errors as (
    select
        field_value
    from
        validation
    where
        field_value <= {{ value }}
)

select *
from validation_errors

{% endtest %}
