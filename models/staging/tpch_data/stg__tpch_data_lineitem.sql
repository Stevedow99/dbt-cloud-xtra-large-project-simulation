
with source as (

    select * from {{ source('tpch_data', 'lineitem') }}

),

renamed as (

    select
        l_orderkey,
        l_partkey,
        l_suppkey,
        l_linenumber,
        l_quantity,
        l_extendedprice,
        l_discount,
        l_tax,
        l_returnflag,
        l_linestatus,
        l_shipdate,
        l_commitdate,
        l_receiptdate,
        l_shipinstruct,
        l_shipmode,
        l_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

