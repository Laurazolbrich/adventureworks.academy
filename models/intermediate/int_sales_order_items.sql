with  
    orders as (
        select *
        from {{ ref('stg_erp__sales_order_header')}}
    )

    , details as (
        select *
        from {{ ref('stg_erp__salesorderdetail')}}
    )

    , joined as (
        select
            orders.pk_salesorderid
            , details.pk_salesorderdetail_id
            , orders.creditcardid
            , orders.shiptoaddressid
            , details.orderqty
            , details.unitprice
            , details.unitpricediscount
            , details.product_id
            , orders.totaldue
            , orders.orderdate
            , orders.sale_status
        from orders
        left join details on orders.pk_salesorderid = details.fk_salesorder_id
    )

select *
from joined