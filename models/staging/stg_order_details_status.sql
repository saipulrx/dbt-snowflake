with source as (

    select * from {{ ref('order_details_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
