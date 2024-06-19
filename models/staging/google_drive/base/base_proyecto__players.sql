with 

src_players as (

    select * from {{ source('google_drive', 'players') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['id'])}} as id_player,
        name::varchar(256) as nickname,
        IFF(nacionality IS NULL, 'Sin Nacionalidad', nacionality)::varchar(256) as nacionality,
        CASE WHEN team = 'Schalke 04' then 'FC Schalke 04'
             WHEN team = 'Vitality' then 'Team Vitality'
             WHEN team = 'Misfits' then 'Misfits Gaming'
             else team
        end::varchar(256) as team,
        join_roster::DATE as join_roster,
        leave_roster::DATE as leave_roster,
        signing_price::decimal(20,2) as signing_price_millions,
        position::varchar(256) as position,
        games_played::INT as games_played,
        winrate::decimal(20,2) as winrate,
        kills::INT as kills,
        deaths::INT as deaths,
        assists::INT as assists,
        cspm::float as cs_minute,
        dpm::float as damage_minute,
        gpm::float as gold_minute,
        wpm::float as wards_minute,
        split::varchar(256) as split,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_players
    ORDER BY nickname

)

select * from renamed
