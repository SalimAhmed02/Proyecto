with 

src_players as (

    select * from {{ ref('stg_proyecto__players') }}

),

renamed as (

    select
        id_player,
        id_nickname,
        nickname,
        id_nacionality,
        nacionality,
        id_team,
        team,
        join_roster,
        leave_roster,
        signing_price_millions,
        id_position,
        position,
        id_split,
        split,
        utc_date_load

    from src_players

)

select * from renamed
