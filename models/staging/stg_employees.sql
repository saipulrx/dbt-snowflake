with source as (

    select * from {{ ref('employees') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source