with 

src_lec_casters as (

    select * from {{ ref('stg_proyecto__casters') }}

),

caster as (

    select
        id_caster,
        caster
    from src_lec_casters


)

select * from caster