with 

src_champions as (

    select * from {{ source('proyecto', 'champions') }}

),

renamed as (

    select
        id::INT as id_champion,
        name::varchar(256) as name_champion,
        position::varchar(256) as position,
        date::DATE as date_realease,
        IFF(spring_wins = 'null', 0, spring_wins)::INT as spring_wins,
        IFF(spring_loses = 'null', 0, spring_loses)::INT as spring_loses,
        IFF(summer_wins = 'null', 0, summer_wins)::INT as summer_wins,
        IFF(summer_loses = 'null', 0, spring_wins)::INT as summer_loses,
        _fivetran_deleted as date_delete,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_champions
    ORDER BY id_champion

)

select * from renamed
