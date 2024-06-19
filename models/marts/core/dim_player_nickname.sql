with 

src_player_nickname as (

    select * from {{ ref('stg_proyecto__player_nickname') }}

),

nickname as (

    select
        id_nickname,
        nickname
    from src_player_nickname
    ORDER BY nickname ASC

)

select * from nickname