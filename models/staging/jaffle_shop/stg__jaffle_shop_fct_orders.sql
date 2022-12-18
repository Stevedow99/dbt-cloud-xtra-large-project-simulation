
with source as (

    select * from {{ source('jaffle_shop', 'fct_orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        amount

    from source

)

select * from renamed

