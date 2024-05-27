with
    fonte_salesreason as (
        select 
            cast(SALESREASONID as int) as pk_salesreasonid
            , cast(NAME as varchar) as nm_salesreason
            , cast(REASONTYPE as varchar) as reasontype_salesreason
            , cast(MODIFIEDDATE as date) as modifieddate_salesreason
        from {{ source('ERP', 'SALESREASON') }}
    )

select *
from fonte_salesreason
