
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
        status,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

