with 

src_matches as (

    select * from {{ source('google_drive', 'matches') }}

),

split1 as (

    select
        id::INT as id_match,
        team_1::varchar(256) as team1,
        team_2::varchar(256) as team2,
        IFF(result = true, team1, team2)::varchar(256) as winner_team,
        game_date::DATE as game_date,
        IFF(caster IS NULL, 'Sin Caster', caster)::varchar(256) as caster,
        IFF(mvp IS NULL, 'Sin MVP', mvp)::varchar(256) as player_mvp,
        blue::varchar(256) as blue_team,
        red::varchar(256) as red_team,
        side_sel::varchar(256) as side_select_team,
        day::varchar(256) as game_day,
        IFF(game_date BETWEEN '2019-01-01' AND '2019-02-28', 'Spring Regular', split)::varchar(256) as split,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_matches
    ORDER BY game_date ASC

),

split2 as (

    select
        id_match,
        team1,
        team2,
        winner_team,
        game_date,
        caster,
        player_mvp,
        blue_team,
        red_team,
        side_select_team,
        game_day,
        IFF(game_date BETWEEN '2019-03-01' AND '2019-03-31', 'Spring Playoffs', split)::varchar(256) as split,
        utc_date_load

    from split1

),

split3 as (

    select
        id_match,
        team1,
        team2,
        winner_team,
        game_date,
        caster,
        player_mvp,
        blue_team,
        red_team,
        side_select_team,
        game_day,
        IFF(game_date BETWEEN '2019-06-01' AND '2019-07-31', 'Summer Regular', split)::varchar(256) as split,
        utc_date_load

    from split2

),

split4 as (

    select
        id_match,
        team1,
        team2,
        winner_team,
        game_date,
        caster,
        player_mvp,
        blue_team,
        red_team,
        side_select_team,
        game_day,
        IFF(game_date BETWEEN '2019-08-01' AND '2019-08-31', 'Summer Playoffs', split)::varchar(256) as split,
        utc_date_load

    from split3

)

select * from split4
