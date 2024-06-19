with 

src_teams as (

    select * from {{ ref('stg_proyecto__teams') }}

),

renamed as (

    select 
        id_team,
        team_name,
        id_acronym,
        acronym_name,
        foundation_date,
        champs_titles,
        utc_date_load

    from src_teams
    ORDER BY team_name

)

select * from renamed