
with source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
        id,
        user_id,
        order_date,
        status,
        _etl_loaded_at,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

