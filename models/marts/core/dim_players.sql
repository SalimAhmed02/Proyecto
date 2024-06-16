with 

src_players as (

    select * from {{ ref('stg_proyecto__players') }}

),

renamed as (

    select
        id_player,
        nickname,
        id_nacionality,
        id_team,
        join_roster,
        id_position,
        games_played,
        winrate,
        kills,
        deaths,
        assists,
        cs_minute,
        damage_minute,
        gold_minute,
        wards_minute,
        id_split,
        utc_date_load

    from src_players

)

select * from renamed
