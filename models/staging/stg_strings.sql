with source as (

    select * from {{ ref('strings') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source