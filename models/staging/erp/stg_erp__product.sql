with
    fonte_product as (
        select 
            CAST(PRODUCTID as int) as pk_product
            , CAST(NAME as varchar) as nm_product
            , CAST(PRODUCTNUMBER as varchar) as product_number 
            , CAST(STANDARDCOST AS DECIMAL) AS standard_cost
            , CAST(LISTPRICE AS DECIMAL) AS list_price
            , CAST(SELLSTARTDATE AS DATE) AS sell_start_date
            , CAST(SELLENDDATE AS DATE) AS sell_end_date
            , CAST(ROWGUID AS VARCHAR(36)) AS rowguid_product
            , CAST(MODIFIEDDATE AS DATE) AS modifieddate_product
        from {{ source('ERP','PRODUCT') }}
    )

select *
from fonte_product