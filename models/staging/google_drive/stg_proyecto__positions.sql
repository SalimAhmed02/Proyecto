with 

src_positions as (

    select position from {{ ref('base_proyecto__champions') }}

),

position as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['position'])}} as id_position,
        position
    from src_positions


)

select * from position