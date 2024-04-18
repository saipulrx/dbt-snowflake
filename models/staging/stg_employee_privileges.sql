with source as (

    select * from {{ ref('employee_privileges') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source