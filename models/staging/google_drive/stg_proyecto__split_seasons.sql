with 

src_split_seasons as (

    select split from {{ ref('base_proyecto__players') }}

),

split as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['split'])}} as id_split,
        split
    from src_split_seasons


)

select * from split