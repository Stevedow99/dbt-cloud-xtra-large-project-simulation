
with source as (

    select * from {{ source('sample_salesforce_data', 'accounts') }}

),

renamed as (

    select
        batchid,
        companyextid,
        company_name,
        city,
        state,
        datecreated,
        modifieddate

    from source

)

select * from renamed

