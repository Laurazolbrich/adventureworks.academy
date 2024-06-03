with
    fonte_sales_order_header as (
        select 
            CAST(SALESORDERID AS INT) AS pk_salesorderid
            , CAST(ORDERDATE AS DATE) AS orderdate
            , CAST(DUEDATE AS DATE) AS duedate
            , CAST(SHIPDATE AS DATE) AS shipdate
            , CAST(STATUS AS INT) AS sale_status
            , CAST(SHIPTOADDRESSID AS INT) AS shiptoaddressid
            , CAST(CREDITCARDID AS INT) AS creditcardid
            , CAST(CREDITCARDAPPROVALCODE AS VARCHAR) AS creditcardapprovalcode
            , CAST(CURRENCYRATEID AS INT) AS currencyrateid
            , CAST(SUBTOTAL AS DECIMAL) AS subtotal
            , CAST(TAXAMT AS DECIMAL) AS taxamt
            , CAST(FREIGHT AS DECIMAL) AS freight
            , CAST(TOTALDUE AS DECIMAL) AS totaldue
            , CAST(ROWGUID AS VARCHAR(36)) AS rowguid_salesorderheader
            , CAST(MODIFIEDDATE AS DATE) AS modifieddate_salesorderheader
        from {{ source('ERP', 'SALESORDERHEADER') }}
    )

select *
from fonte_sales_order_header