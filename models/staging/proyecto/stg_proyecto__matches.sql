with 

src_matches as (

    select * from {{ ref('base_proyecto__matches') }}

),

renamed as (

    select
        id_match,
        team1,
        team2,
        winner,
        game_date,
        {{dbt_utils.generate_surrogate_key(['caster'])}} as id_caster,
        mvp,
        blue_team,
        red_team,
        side_select_team,
        game_day,
        split,
        utc_date_load

    from src_matches

)

select * from renamed
