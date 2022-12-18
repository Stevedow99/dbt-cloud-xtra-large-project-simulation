
with source as (

    select * from {{ source('sample_customer_data', 'purchases_fct') }}

),

renamed as (

    select
        id,
        customer_id,
        amount

    from source

)

select * from renamed

