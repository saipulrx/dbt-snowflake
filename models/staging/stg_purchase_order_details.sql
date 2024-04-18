with source as (

    select * from {{ ref('purchase_order_details') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source