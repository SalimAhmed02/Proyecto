with 

src_players as (

    select id_nickname,
        id_team,
        join_roster,
        leave_roster,
        signing_price_millions
    from {{ ref('stg_proyecto__players') }}

),

renamed as (

    select distinct
        id_nickname,
        id_team,
        join_roster,
        leave_roster,
        signing_price_millions

    from src_players

)

select * from renamed
