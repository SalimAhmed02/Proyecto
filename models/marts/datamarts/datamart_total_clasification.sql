with 

src_clasification as (

    select * from {{ ref('int_split_clasification') }}

),

clasification as (

    select
        id_team,
        team_name,
        SUM(total_wins) as total_wins,
        SUM(total_loses) as total_loses

    from src_clasification
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

    from clasification
    ORDER BY total_wins DESC

)

select * from final
