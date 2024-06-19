with 

src_matches as (

    select * from {{ ref('base_proyecto__matches') }}

),

renamed as (

    select
        id_match,
        {{dbt_utils.generate_surrogate_key(['team1'])}} as id_team1,
        team1,
        {{dbt_utils.generate_surrogate_key(['team2'])}} as id_team2,
        team2,
        {{dbt_utils.generate_surrogate_key(['winner_team'])}} as id_winner_team,
        winner_team,
        game_date,
        {{dbt_utils.generate_surrogate_key(['caster'])}} as id_caster,
        caster,
        {{dbt_utils.generate_surrogate_key(['player_mvp'])}} as id_player_mvp,
        player_mvp,
        {{dbt_utils.generate_surrogate_key(['blue_team'])}} as id_blue_team,
        blue_team,
        {{dbt_utils.generate_surrogate_key(['red_team'])}} as id_red_team,
        red_team,
        {{dbt_utils.generate_surrogate_key(['side_select_team'])}} as id_side_select_team,
        side_select_team,
        game_day,
        {{dbt_utils.generate_surrogate_key(['split'])}} as id_split,
        split,
        utc_date_load as utc_date_load

    from src_matches
    ORDER BY game_date ASC

)

select * from renamed
