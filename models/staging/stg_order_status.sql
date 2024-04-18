with source as (

    select * from {{ ref('orders_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source