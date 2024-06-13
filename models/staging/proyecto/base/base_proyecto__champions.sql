with 

src_champions as (

    select * from {{ source('proyecto', 'champions') }}

),

renamed as (

    select
        id as id_champion,
        name as name_champion,
        position,
        date as date_realease,
        spring_wins,
        spring_loses,
        summer_wins,
        summer_loses,
        _fivetran_deleted as date_delete,
        _fivetran_synced as date_load

    from src_champions
    ORDER BY id_champion

)

select * from renamed
