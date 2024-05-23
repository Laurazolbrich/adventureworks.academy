with 
    fonte_personcreditcard as (
        select 
            cast(BUSINESSENTITYID as int) as fk_businessentity
            , cast(CREDITCARDID as int) as fk_creditcard
            , cast(MODIFIEDDATE as date) as modifieddate_personcreditcard
        from {{ source('ERP', 'PERSONCREDITCARD') }}
    )

select *
from fonte_personcreditcard