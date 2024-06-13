with 

src_matches as (

    select * from {{ ref('base_proyecto__matches') }}

),

renamed as (

    select
        id,
        team1,
        team2,
        result,
        game_date,
        caster,
        mvp,
        blue,
        red,
        side_sel,
        day,
        split

    from src_matches

)

select * from renamed
