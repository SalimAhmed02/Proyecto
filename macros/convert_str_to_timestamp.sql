-- description: Convierte una fecha en formato varchar a timestamp
{{ macro convert_str_to_timestamp(date_str, format) }}
    {{ dbt_date.parse_date(date_str, format) }}
{{ endmacro }}