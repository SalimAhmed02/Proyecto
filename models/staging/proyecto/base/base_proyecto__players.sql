with 

src_players as (

    select * from {{ source('proyecto', 'players') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['id'])}} as id_player,
        name::varchar(256) as nickname,
        IFF(nacionality IS NULL, 'Sin Nacionalidad', nacionality)::varchar(256) as nacionality,
        team::varchar(256) as team,
        join_roster::DATE as join_roster,
        position::varchar(256) as position,
        games_played::INT as games_played,
        winrate::INT as winrate,
        kills::INT as kills,
        deaths::INT as deaths,
        assists::INT as assists,
        cspm::float as cs_minute,
        dpm::float as damage_minute,
        gpm::float as gold_minute,
        wpm::float as wards_minute,
        split::varchar(256) as split,
        _fivetran_deleted as date_delete,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_players
    ORDER BY nickname

)

select * from renamed
