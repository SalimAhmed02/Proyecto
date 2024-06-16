with 

src_split_season as (

    select * from {{ ref('stg_proyecto__split_seasons') }}

),

split as (

    select
        id_split,
        split
    from src_split_season


)

select * from split