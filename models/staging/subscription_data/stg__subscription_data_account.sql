
with source as (

    select * from {{ source('subscription_data', 'account') }}

),

renamed as (

    select
        id,
        name,
        state,
        city,
        _loaded_at,
        deleted_at,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

