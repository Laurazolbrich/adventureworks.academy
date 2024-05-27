with
    fonte_salesorderheadersalesreason as (
        select 
            cast(SALESORDERID as int) as pk_salesorderid
            , cast(SALESREASONID as int) as fk_salesreasonid
            , cast(MODIFIEDDATE as date) as modifieddate_salesorderheadersalesreason
        from {{ source('ERP', 'SALESORDERHEADERSALESREASON') }}
    )

select *
from fonte_salesorderheadersalesreason