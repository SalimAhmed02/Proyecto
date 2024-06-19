with 

src_players as (

    select * from {{ ref('stg_proyecto__players') }}

),

renamed as (

    select
        id_player,
        id_nickname,
        id_nacionality,
        id_team,
        join_roster,
        leave_roster,
        signing_price_millions,
        id_position,
        id_split,
        utc_date_load

    from src_players

)

select * from renamed
