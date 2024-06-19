with 

src_matches as (

    select * from {{ ref('stg_proyecto__matches') }}

),

renamed as (

    select
        id_match,
        id_team1,
        team1,
        id_team2,
        team2,
        id_winner_team,
        winner_team,
        game_date,
        id_caster,
        caster,
        id_player_mvp,
        player_mvp,
        id_blue_team,
        blue_team,
        id_red_team,
        red_team,
        id_side_select_team,
        side_select_team,
        game_day,
        id_split,
        split,
        utc_date_load

    from src_matches
    ORDER BY game_date ASC

)

select * from renamed
