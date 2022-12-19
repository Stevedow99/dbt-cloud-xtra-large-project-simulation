
with source as (

    select * from {{ source('tpch_data', 'nation') }}

),

renamed as (

    select
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

