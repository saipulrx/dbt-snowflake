with source as (

    select * from {{ ref('customer') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
