with 

src_lec_casters as (

    select caster from {{ ref('base_proyecto__matches') }}

),

caster as (

    select distinct
        {{dbt_utils.generate_surrogate_key(['caster'])}} as id_caster,
        caster
    from src_lec_casters


)

select * from caster