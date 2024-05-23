with
    fonte_creditcard as (
        select 
            cast(CREDITCARDID as int) as pk_creditcard
            , cast(CARDTYPE as varchar) as cardtype_creditcard
            , cast(CARDNUMBER as varchar) as cardnumber_creditcard
            , cast(EXPMONTH as int) as expmonth_creditcard
            , cast(EXPYEAR as int) as expyear_creditcard
            , cast(MODIFIEDDATE as date) as modifieddate_creditcard
        from {{ source('ERP', 'CREDITCARD') }}
    )

select *
from fonte_creditcard
