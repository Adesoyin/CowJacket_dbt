{% macro block_prod_run(model_name) %}
    {% if target.name == 'prod' %}
        {{ exceptions.raise_compiler_error(
            model_name ~ " is blocked from materializing in production."
        ) }}
    {% endif %}
{% endmacro %}