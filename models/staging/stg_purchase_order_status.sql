with source as (

    select * from {{ ref('purchase_order_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source