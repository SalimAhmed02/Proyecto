with 

src_player_nacionality as (

    select * from {{ ref('stg_proyecto__player_nacionality') }}

),

nacionality as (

    select
        id_nacionality,
        nacionality
    from src_player_nacionality

)

select * from nacionality