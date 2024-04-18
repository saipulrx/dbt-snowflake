with source as (

    select * from {{ ref('shippers') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source