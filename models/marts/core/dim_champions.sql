with 

src_champions as (

    select * from {{ ref('stg_proyecto__champions') }}

),

renamed as (

    select
        id_champion,
        name_champion,
        id_position,
        position,
        date_realease,
        champion_available,
        utc_date_load

    from src_champions
    ORDER BY name_champion

)

select * from renamed
