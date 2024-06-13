with 

src_player_nacionality as (

    select nacionality from {{ ref('base_proyecto__players') }}

),

nacionality as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['nacionality'])}} as id_nacionality,
        nacionality
    from src_player_nacionality


)

select * from nacionality