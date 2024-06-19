with 

src_champions as (

    select * from {{ ref('int_stats_champions') }}

),

stats_champions as (

    select
        id_champion,
        name_champion,
        total_games,
        total_wins,
        total_loses,
        spring_games,
        spring_wins,
        spring_loses,
        summer_games,
        summer_wins,
        summer_loses,
        total_winrate,
        spring_winrate,
        summer_winrate,
        utc_date_load

    from src_champions
    ORDER BY name_champion

)

select * from stats_champions
