with 

src_stats_players as (

    select * from {{ ref('int_stats_players') }}

),

stats_players as (

    select
        id_player,
        id_nickname,
        id_position,
        games_played,
        wins,
        loses,
        winrate,
        kills,
        deaths,
        assists,
        kda,
        cs_minute,
        damage_minute,
        gold_minute,
        wards_minute,
        id_split,
        split,
        utc_date_load

    from src_stats_players

)

select * from stats_players
