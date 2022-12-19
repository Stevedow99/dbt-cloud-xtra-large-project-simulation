
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
        modifieddate,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

