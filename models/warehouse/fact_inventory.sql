{{ config(
    partition_by={
      "field": "transaction_created_date",
      "data_type": "date"
    }
)}}
with source as (
    select
        id as inventory_id,
        transaction_type,
        date(transaction_created_date) as transaction_created_date,
        transaction_modified_date,
        product_id,
        quantity,
        purchase_order_id,
        customer_order_id,
        comments,
        current_timestamp() as insertion_timestamp,
    from {{ ref('stg_inventory_transactions') }}
)
select * 
from source