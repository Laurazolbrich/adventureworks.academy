with
    customers as (
        select *
        from {{ ref('dim_customer')}}
    )

    , location as (
        select *
        from {{ ref('dim_location')}}
    )

    , sales_reason as (
        select *
        from {{ ref('dim_sales_reason')}}
    )

    , product as (
        select *
        from {{ ref('dim_products')}}
    )

    , sale_order as (
        select *  
        from {{ ref('int_sales_order_items')}}
    )

    , dates as (
        select *
        from {{ ref('dim_dates') }}
    )

    , joined as (
        select 
            sale_order.pk_salesorderid
            , customers.sk_businessentity_id as fk_ccustomers
            , location.SK_STATEPROVINCE_ID as fk_location
            , product.sk_product as fk_product 
            , sales_reason.sk_salesreasonid as fk_sales_reason
            , sale_order.orderqty as quantity
            , sale_order.unitprice 
            , sale_order.unitpricediscount as unit_discount
            , product.nm_product 
            , customers.cardtype
            , sales_reason.nm_salesreason
            , sale_order.orderdate
            , customers.firstname as name
            , customers.middlename
            , customers.lastname 
            , sale_order.sale_status
            , location.nm_country as country
            , location.nm_state as state 
            , location.city
            , dates.full_date
            , dates.day
            , dates.month
            , dates.year


        from sale_order
        left join customers on sale_order.creditcardid = customers.fk_creditcard
        left join location on sale_order.shiptoaddressid = location.pk_address
        left join sales_reason on sale_order.pk_salesorderid = sales_reason.fk_salesorderid
        left join product on sale_order.product_id = product.pk_product
        left join dates on sale_order.orderdate = dates.full_date
    
    )

    , transformations as (
        select
            pk_salesorderid || '-' || fk_product as sk_sale
            , *
            , CONCAT(name, ' ', lastname) as fullname
            , unitprice - (unitprice*unit_discount) as unit_price_with_discount
        from joined
    )

select * 
from transformations