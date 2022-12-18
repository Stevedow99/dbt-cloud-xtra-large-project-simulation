
with source as (

    select * from {{ source('sample_salesforce_data', 'contacts') }}

),

renamed as (

    select
        batchid,
        companyextid,
        first_name,
        last_name,
        email,
        country,
        contactid,
        datecreated,
        modifieddate

    from source

)

select * from renamed

