with
    fonte_countryregion as (
        select 
            cast(COUNTRYREGIONCODE as varchar) as pk_countryregion
            , cast(NAME as varchar) as nm_countryregion
            , cast(MODIFIEDDATE as date) as modifieddate_countryregion
        from {{ source('ERP', 'COUNTRYREGION') }}
    )

select *
from fonte_countryregion