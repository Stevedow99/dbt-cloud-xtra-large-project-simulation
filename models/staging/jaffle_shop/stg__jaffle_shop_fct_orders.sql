
with source as (

    select * from {{ source('jaffle_shop', 'fct_orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        amount,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

