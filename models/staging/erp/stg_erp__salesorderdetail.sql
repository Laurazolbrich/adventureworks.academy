with
    fonte_salesorderdetail as (
        select 
         cast(SALESORDERID as int) as fk_salesorder_id
        , cast(SALESORDERDETAILID as int) as pk_salesorderdetail_id
        , cast(CARRIERTRACKINGNUMBER as varchar) as Trackingnumber
        , cast(ORDERQTY as int) as orderqty
        , cast(PRODUCTID as int) as product_id
        , cast(SPECIALOFFERID as int) as specialofferid
        , cast(UNITPRICE as number) as unitprice
        , cast(UNITPRICEDISCOUNT as number) as unitpricediscount
        from {{ source('ERP', 'SALESORDERDETAIL') }}
    )

select *
from fonte_salesorderdetail