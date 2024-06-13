with 

src_players as (

    select * from {{ ref('base_proyecto__players') }}

),

renamed as (

    select
        id,
        name,
        nacionality,
        team,
        join_roster,
        position,
        games_played,
        winrate,
        kills,
        deaths,
        assists,
        cspm,
        dpm,
        gpm,
        wpm,
        split

    from src_players

)

select * from renamed
