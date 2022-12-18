
with source as (

    select * from {{ source('sample_salesforce_data', 'opportunites') }}

),

renamed as (

    select
        batchid,
        companextid,
        amount,
        project_name,
        oppurtunity_name,
        stage,
        close_date,
        createddate,
        modifieddate,
        rand_number,
        oppurtunityid,
        datecreated

    from source

)

select * from renamed

