
with source as (

    select * from {{ source('jaffle_shop', 'dim_customers') }}

),

renamed as (

    select
        customer_id,
        first_name,
        last_name,
        first_order_date,
        most_recent_order_date,
        number_of_orders,
        lifetime_value

    from source

)

select * from renamed

