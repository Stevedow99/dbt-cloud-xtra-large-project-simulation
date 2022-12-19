
with source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id,
        first_name,
        last_name,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

