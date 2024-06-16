with 

src_positions as (

    select * from {{ ref('stg_proyecto__positions') }}

),

position as (

    select
        id_position,
        position
    from src_positions


)

select * from position