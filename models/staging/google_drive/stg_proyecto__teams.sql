with 

src_teams as (

    select * from {{ source('google_drive', 'teams') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['name'])}} as id_team,
        name::varchar(256) as team_name,
        {{dbt_utils.generate_surrogate_key(['acronym'])}} as id_acronym,
        acronym::varchar(256) as acronym_name,
        foundation_date::DATE as foundation_date,
        champs_titles::INT as champs_titles,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_teams
    ORDER BY team_name

)

select * from renamed
