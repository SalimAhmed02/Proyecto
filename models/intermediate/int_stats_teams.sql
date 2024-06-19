with 

src_teams as (

    select * from {{ ref('stg_proyecto__teams') }}

),

src_matches as (

    select * from {{ ref('stg_proyecto__matches') }}

),

src_split_seasons as (

    select * from {{ ref('stg_proyecto__split_seasons') }}

),

renamed as (

    select 
        t.id_team,
        t.team_name,
        t.id_acronym,
        SUM(CASE WHEN m.id_team1 = t.id_team THEN 1 ELSE 0 END)::INT as local_games,
        SUM(CASE WHEN m.id_team2 = t.id_team THEN 1 ELSE 0 END)::INT as away_games,
        (local_games + away_games)::INT as total_games,
        SUM(CASE WHEN m.id_team1 = t.id_team AND m.id_team1 = m.id_winner_team THEN 1 ELSE 0 END)::INT local_wins,
        (local_games - local_wins)::INT as local_loses,
        SUM(CASE WHEN m.id_team2 = t.id_team AND m.id_team2 = m.id_winner_team THEN 1 ELSE 0 END)::INT away_wins,
        (away_games - away_wins)::INT as away_loses,
        (local_wins + away_wins)::INT as total_wins,
        (local_loses + away_loses)::INT as total_loses,
        IFF(local_games = 0, 0, ((local_wins * 100) / local_games)::decimal(20,2)) as local_winrate,
        IFF(away_games = 0, 0, ((away_wins * 100) / away_games)::decimal(20,2)) as away_winrate,
        ((total_wins * 100) / total_games)::decimal(20,2) as total_winrate,
        SUM(CASE WHEN m.id_blue_team = t.id_acronym THEN 1 ELSE 0 END)::INT as blue_games,
        SUM(CASE WHEN m.id_red_team = t.id_acronym THEN 1 ELSE 0 END)::INT as red_games,
        SUM(CASE WHEN m.id_side_select_team = t.id_acronym THEN 1 ELSE 0 END)::INT as side_select_games,
        ((blue_games * 100) / total_games)::decimal(20,2) as blue_rate,
        ((red_games * 100) / total_games)::decimal(20,2) as red_rate,
        ((side_select_games * 100) / total_games)::decimal(20,2) as side_select_rate,
        m.id_split,
        s.split,
        t.utc_date_load

    from src_teams t
    join src_matches m
    ON t.id_team = m.id_team1 OR t.id_team = m.id_team2 OR t.id_acronym = m.id_blue_team OR t.id_acronym = m.id_red_team
    join src_split_seasons s
    ON m.id_split = s.id_split
    GROUP BY t.id_team, t.team_name, t.id_acronym, t.utc_date_load, m.id_split, s.split
    ORDER BY t.team_name

)

select * from renamed