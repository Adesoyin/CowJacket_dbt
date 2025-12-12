{% macro log_model_run(model_name, status, row_count) %}

    {% set sql %}
        insert into canalytics.public.dbt_logs (
            run_id, 
            model_name, 
            environment, 
            status,
            started_at, 
            finished_at, 
            duration_seconds,
            row_count, 
            sql_text
        )
        select
            '{{ invocation_id }}' as run_id,
            '{{ model_name }}' as model_name,
            '{{ target.name }}' as environment,
            '{{ status }}' as status,
            '{{ run_started_at }}'::timestamp as started_at,
            current_timestamp() as finished_at,
            datediff(
                'second',
                '{{ run_started_at }}'::timestamp,
                current_timestamp()
            ) as duration_seconds,
            {{ row_count | default(0) }} as row_count,
            '{{ compiled_sql | replace("'", "''") }}' as sql_text;
    {% endset %}

    {% do run_query(sql) %}

{% endmacro %}
