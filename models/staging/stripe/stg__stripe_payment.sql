
with source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id,
        orderid,
        paymentmethod,
        amount,
        created,
        status

    from source

)

select * from renamed

