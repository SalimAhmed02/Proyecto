with 

src_champions as (

    select * from {{ source('snapshots', 'snapshot_new_champion') }}
    where DBT_VALID_TO IS NULL

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['name'])}} as id_champion,
        name::varchar(256) as name_champion,
        IFF(position = 'Mid', 'Middle', position)::varchar(256) as position,
        date::DATE as date_realease,
        IFF(spring_wins = 'null', 0, spring_wins)::INT as spring_wins,
        IFF(spring_loses = 'null', 0, spring_loses)::INT as spring_loses,
        IFF(summer_wins = 'null', 0, summer_wins)::INT as summer_wins,
        IFF(summer_loses = 'null', 0, spring_wins)::INT as summer_loses,
        IFF(date_realease > '2019-08-17', false, true)::boolean as champion_available,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_champions
    ORDER BY name_champion

)

select * from renamed
