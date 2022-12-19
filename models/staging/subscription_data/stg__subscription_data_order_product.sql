
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
        _loaded_at,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

