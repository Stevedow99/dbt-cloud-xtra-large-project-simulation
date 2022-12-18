
with source as (

    select * from {{ source('sample_customer_data', 'customer_dim') }}

),

renamed as (

    select
        id,
        gender,
        birthdate,
        maiden_name,
        lname,
        fname,
        address,
        city,
        state,
        zip,
        phone,
        email,
        cc_type,
        cc_number,
        cc_cvc,
        cc_expiredate,
        customer_join_date

    from source

)

select * from renamed

