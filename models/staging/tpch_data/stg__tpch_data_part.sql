
with source as (

    select * from {{ source('tpch_data', 'part') }}

),

renamed as (

    select
        p_partkey,
        p_name,
        p_mfgr,
        p_brand,
        p_type,
        p_size,
        p_container,
        p_retailprice,
        p_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

