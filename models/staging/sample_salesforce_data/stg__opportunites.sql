
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
        datecreated,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

