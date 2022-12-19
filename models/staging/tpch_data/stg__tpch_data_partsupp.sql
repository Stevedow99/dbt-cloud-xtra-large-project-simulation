
with source as (

    select * from {{ source('tpch_data', 'partsupp') }}

),

renamed as (

    select
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

