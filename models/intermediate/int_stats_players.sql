with 

src_players as (

    select * from {{ ref('stg_proyecto__players') }}

),

src_split_seasons as (

    select * from {{ ref('stg_proyecto__split_seasons') }}

),

renamed as (

    select
        id_player,
        id_nickname,
        nickname,
        id_position,
        position,
        games_played,
        winrate,
        ((winrate * games_played) / 100)::INT as wins,
        (games_played - wins)::INT as loses,
        kills,
        deaths,
        assists,
        IFF(deaths = 0, (kills + assists), ((kills + assists) / deaths))::decimal(20,2) as kda,
        cs_minute,
        damage_minute,
        gold_minute,
        wards_minute,
        s.id_split,
        s.split,
        utc_date_load

    from src_players p
    join src_split_seasons s
    ON p.id_split = s.id_split
)

select * from renamed
