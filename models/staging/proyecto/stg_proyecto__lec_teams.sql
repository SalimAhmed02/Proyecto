with 

src_lec_teams as (

    select team from {{ ref('base_proyecto__players') }}

),

club as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['team'])}} as id_team,
        team
    from src_lec_teams


)

select * from club