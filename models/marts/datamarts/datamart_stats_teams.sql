with 

src_stats_teams as (

    select * from {{ ref('int_stats_teams') }}

),

stats_teams as (

    select
        id_team,
        team_name,
        total_games,
        local_games,
        away_games,
        total_wins,
        total_loses,
        local_wins,
        local_loses,
        away_wins,
        away_loses,
        total_winrate,
        local_winrate,
        away_winrate,
        blue_games,
        red_games,
        side_select_games,
        blue_rate,
        red_rate,
        side_select_rate,
        id_split,
        split,
        utc_date_load

    from src_stats_teams
    ORDER BY team_name

)

select * from stats_teams
