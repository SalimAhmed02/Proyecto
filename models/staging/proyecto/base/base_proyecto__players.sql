with 

src_players as (

    select * from {{ source('proyecto', 'players') }}

),

renamed as (

    select
        id as id_player,
        name as nickname,
        nacionality,
        team,
        join_roster,
        position,
        games_played,
        winrate,
        kills,
        deaths,
        assists,
        cspm as cs_minute,
        dpm as damage_minute,
        gpm as gold_minute,
        wpm as wards_minute,
        split,
        _fivetran_deleted as date_delete,
        _fivetran_synced as date_load

    from src_players
    ORDER BY id_player

)

select * from renamed
