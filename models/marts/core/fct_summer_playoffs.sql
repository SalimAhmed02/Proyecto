with 

src_clasification as (

    select * from {{ ref('int_split_clasification') }}

),

src_split_seasons as (

    select * from {{ ref('stg_proyecto__split_seasons') }}

),

summer_playoffs as (

    select
        id_team,
        team_name,
        SUM(total_wins) as total_wins,
        SUM(total_loses) as total_loses

    from src_clasification c
    join src_split_seasons s
    ON c.id_split = s.id_split
    WHERE s.split = 'Summer Playoffs'
    GROUP BY id_team, team_name
    ORDER BY total_wins DESC

),

final as (

    select
        ROW_NUMBER() over (ORDER BY total_wins DESC) as place,
        id_team,
        team_name,
        total_wins,
        total_loses

    from summer_playoffs
    ORDER BY total_wins DESC

)

select * from final
