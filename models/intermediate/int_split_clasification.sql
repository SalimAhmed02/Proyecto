with 

src_teams as (

    select * from {{ ref('stg_proyecto__teams') }}

),

src_matches as (

    select * from {{ ref('stg_proyecto__matches') }}

),

clasification as (

    select
        id_team,
        team_name,
        SUM(CASE WHEN m.id_team1 = t.id_team THEN 1 ELSE 0 END)::INT as local_games,
        SUM(CASE WHEN m.id_team2 = t.id_team THEN 1 ELSE 0 END)::INT as away_games,
        (local_games + away_games)::INT as total_games,
        SUM(CASE WHEN m.id_team1 = t.id_team AND m.id_team1 = m.id_winner_team THEN 1 ELSE 0 END)::INT local_wins,
        (local_games - local_wins)::INT as local_loses,
        SUM(CASE WHEN m.id_team2 = t.id_team AND m.id_team2 = m.id_winner_team THEN 1 ELSE 0 END)::INT away_wins,
        (away_games - away_wins)::INT as away_loses,
        (local_wins + away_wins)::INT as total_wins,
        (local_loses + away_loses)::INT as total_loses,
        id_split

    from src_teams t
    join src_matches m
    ON t.id_team = m.id_team1 OR t.id_team = m.id_team2
    GROUP BY id_team, team_name, id_split
    ORDER BY total_wins DESC

),

final as (

    select
        id_team,
        team_name,
        total_wins,
        total_loses,
        id_split

    from clasification
    ORDER BY total_wins DESC

)

select * from final
