
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
        lifetime_value,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

