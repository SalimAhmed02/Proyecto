with 

src_players as (

    select * from {{ ref('base_proyecto__players') }}

),

renamed as (

    select
        id_player,
        {{dbt_utils.generate_surrogate_key(['nickname'])}} as id_nickname,
        {{dbt_utils.generate_surrogate_key(['nacionality'])}} as id_nacionality,
        {{dbt_utils.generate_surrogate_key(['team'])}} as id_team,
        join_roster,
        leave_roster,
        signing_price_millions,
        {{dbt_utils.generate_surrogate_key(['position'])}} as id_position,
        games_played,
        winrate,
        kills,
        deaths,
        assists,
        cs_minute,
        damage_minute,
        gold_minute,
        wards_minute,
        {{dbt_utils.generate_surrogate_key(['split'])}} as id_split,
        utc_date_load

    from src_players

)

select * from renamed
