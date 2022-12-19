
with source as (

    select * from {{ source('sample_customer_data', 'purchases_fct') }}

),

renamed as (

    select
        id,
        customer_id,
        amount,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

