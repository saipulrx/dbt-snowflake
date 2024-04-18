with source as (

    select * from {{ ref('privileges') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source