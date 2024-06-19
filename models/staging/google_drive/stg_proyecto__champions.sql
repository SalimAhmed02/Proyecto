with 

src_champions as (

    select * from {{ ref('base_proyecto__champions') }}

),

renamed as (

    select
        id_champion,
        name_champion,
        {{dbt_utils.generate_surrogate_key(['position'])}} as id_position,
        position,
        date_realease,
        spring_wins,
        spring_loses,
        summer_wins,
        summer_loses,
        champion_available,
        utc_date_load

    from src_champions
    ORDER BY name_champion

)

select * from renamed
