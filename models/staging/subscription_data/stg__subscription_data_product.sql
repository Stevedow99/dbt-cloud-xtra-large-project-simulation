
with source as (

    select * from {{ source('subscription_data', 'product') }}

),

renamed as (

    select
        id,
        name,
        unit,
        unit_rate,
        type,
        unit_timing,
        status,
        deleted_at,
        _loaded_at,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

