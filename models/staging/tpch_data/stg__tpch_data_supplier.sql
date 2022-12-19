
with source as (

    select * from {{ source('tpch_data', 'supplier') }}

),

renamed as (

    select
        s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

