{{
    config(
        materialized = "table"
    )
}}
{{ dbt_date.get_date_dimension('1990-01-01', '2025-12-31') }}