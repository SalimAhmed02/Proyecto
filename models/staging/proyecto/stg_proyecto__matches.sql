with 

src_matches as (

    select * from {{ ref('base_proyecto__matches') }}

),

renamed as (

    select
        id_match,
        {{dbt_utils.generate_surrogate_key(['team1'])}} as id_team1,
        {{dbt_utils.generate_surrogate_key(['team2'])}} as id_team2,
        {{dbt_utils.generate_surrogate_key(['winner'])}} as id_winner_team,
        game_date,
        {{dbt_utils.generate_surrogate_key(['caster'])}} as id_caster,
        {{dbt_utils.generate_surrogate_key(['mvp'])}} as id_player_mvp,
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
