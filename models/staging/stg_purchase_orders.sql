with source as (

    select * from {{ ref('purchase_orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source