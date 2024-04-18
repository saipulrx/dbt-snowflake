with source as (

    select * from {{ ref('orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source