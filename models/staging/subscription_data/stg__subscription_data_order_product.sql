
with source as (

    select * from {{ source('subscription_data', 'order_product') }}

),

renamed as (

    select
        id,
        order_id,
        product_id,
        quantity_change,
        deleted_at,
        _loaded_at

    from source

)

select * from renamed

