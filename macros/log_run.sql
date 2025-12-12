{% macro log_model_run(model_name, status, row_count) %}
    {% set sql %}
        insert into analytics_staging.dbt_logs (
            run_id, model_name, environment, status,
            started_at, finished_at, duration_seconds,
            row_count, sql_text
        )
        values (
            '{{ invocation_id }}',
            '{{ model_name }}',
            '{{ target.name }}',
            '{{ status }}',
            '{{ run_started_at }}',
            current_timestamp(),
            datediff('second', '{{ run_started_at }}', current_timestamp()),
            {{ row_count }},
            '{{ compiled_sql | replace("'", "''") }}'
        )
    {% endset %}

    {% do run_query(sql) %}
{% endmacro %}
