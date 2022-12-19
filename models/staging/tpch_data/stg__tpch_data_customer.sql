
with source as (

    select * from {{ source('tpch_data', 'customer') }}

),

renamed as (

    select
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

