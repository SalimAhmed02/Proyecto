with 

src_matches as (

    select * from {{ source('proyecto', 'matches') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['id'])}} as id_match,
        team1::varchar(256) as team1,
        team2::varchar(256) as team2,
        IFF(result = true, team1, team2)::varchar(256) as winner,
        game_date::DATE as game_date,
        IFF(caster IS NULL, 'Sin Caster', caster)::varchar(256) as caster,
        IFF(mvp IS NULL, 'Sin MVP', mvp)::varchar(256) as mvp,
        blue::varchar(256) as blue_team,
        red::varchar(256) as red_team,
        side_sel::varchar(256) as side_select_team,
        day::varchar(256) as game_day,
        split::varchar(256) as split,
        _fivetran_deleted as date_delete,
        {{ convert_to_utc('_fivetran_synced') }} as utc_date_load

    from src_matches
    ORDER BY game_date ASC

)

select * from renamed
