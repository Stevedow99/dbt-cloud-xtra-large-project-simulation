
with source as (

    select * from {{ source('tpch_data', 'orders') }}

),

renamed as (

    select
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderdate,
        o_orderpriority,
        o_clerk,
        o_shippriority,
        o_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

