
with source as (

    select * from {{ source('sample_salesforce_data', 'leads') }}

),

renamed as (

    select
        batchid,
        first_name,
        last_name,
        email,
        company,
        lead_status,
        leadid,
        contactid,
        datecreated,
        modifieddate,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

