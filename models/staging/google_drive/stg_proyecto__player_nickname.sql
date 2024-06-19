with 

src_player_nickname as (

    select nickname from {{ ref('base_proyecto__players') }}

),

nickname as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['nickname'])}} as id_nickname,
        nickname
    from src_player_nickname
    ORDER BY nickname ASC

)

select * from nickname