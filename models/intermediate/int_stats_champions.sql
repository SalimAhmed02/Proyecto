with 

src_champions as (

    select * from {{ ref('stg_proyecto__champions') }}

),

renamed as (

    select
        id_champion,
        name_champion,
        spring_wins,
        spring_loses,
        summer_wins,
        summer_loses,
        (spring_wins + summer_wins)::INT as total_wins,
        (spring_loses + summer_loses)::INT as total_loses,
        (total_wins + total_loses)::INT as total_games,
        (spring_wins + spring_loses)::INT as spring_games,
        (summer_wins + summer_loses)::INT as summer_games,
        IFF(spring_games = 0, 0, ((spring_wins * 100) / spring_games))::decimal(20,2) as spring_winrate,
        IFF(summer_games = 0, 0, ((summer_wins * 100) / summer_games))::decimal(20,2) as summer_winrate,
        IFF(total_games = 0, 0, ((total_wins * 100) / total_games))::decimal(20,2) as total_winrate,
        utc_date_load

    from src_champions
    ORDER BY name_champion

)

select * from renamed
