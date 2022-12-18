
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
        deleted_at

    from source

)

select * from renamed

