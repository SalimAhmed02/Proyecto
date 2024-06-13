with 

src_champions as (

    select * from {{ ref('base_proyecto__champions') }}

),

renamed as (

    select
        id_champion,
        name_champion,
        position,
        date_realease,
        spring_wins,
        spring_loses,
        summer_wins,
        summer_loses,
        date_load

    from src_champions

)

select * from renamed
