{% snapshot snapshot_new_champion %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

select * 
from {{ source('google_drive', 'champions') }} 

{% endsnapshot %}