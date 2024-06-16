with 

src_matches as (

    select * from {{ ref('stg_proyecto__matches') }}

),

renamed as (

    select
        id_match,
        id_team1,
        id_team2,
        id_winner_team,
        game_date,
        id_caster,
        id_player_mvp,
        blue_team,
        red_team,
        side_select_team,
        game_day,
        split,
        utc_date_load

    from src_matches
    ORDER BY game_date ASC

)

select * from renamed
