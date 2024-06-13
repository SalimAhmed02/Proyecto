{% macro convert_date_format(date_string) %}
  {{ dbt_date(date_string, 'Y-m-d') | format('%d-%m-%Y') }}
{% endmacro %}