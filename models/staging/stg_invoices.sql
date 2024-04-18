with source as (

    select * from {{ ref('invoices') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source