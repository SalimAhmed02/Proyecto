with 

src_matches as (

    select * from {{ source('proyecto', 'matches') }}

),

renamed as (

    select
        id as id_match,
        team1,
        team2,
        result as winner,
        game_date,
        caster,
        mvp,
        blue as blue_team,
        red as red_team,
        side_sel as side_select_team,
        day as game_day,
        split,
        _fivetran_deleted as date_delete,
        _fivetran_synced as date_load

    from src_matches
    ORDER BY id_match

)

select * from renamed
