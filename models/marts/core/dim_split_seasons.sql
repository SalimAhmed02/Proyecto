with 

src_split_seasons as (

    select * from {{ ref('stg_proyecto__split_seasons') }}

),

split as (

    select
        id_split,
        split
    from src_split_seasons


)

select * from split