
with source as (

    select * from {{ source('tpch_data', 'region') }}

),

renamed as (

    select
        r_regionkey,
        r_name,
        r_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

