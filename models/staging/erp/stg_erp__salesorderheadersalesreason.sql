with
    fonte_salesorderheadersalesreason as (
        select 
            cast(SALESORDERID as int) as pk_salesorderheadersalesreason
            , cast(SALESREASONID as int) as fk_salesorderheadersalesreason
            , cast(MODIFIEDDATE as date) as modifieddate_salesorderheadersalesreason
        from {{ source('ERP', 'SALESORDERHEADERSALESREASON') }}
    )

select *
from fonte_salesorderheadersalesreason