






with
    motivo_de_venda as (
        select *
        from {{ ref('stg_erp__salesreason') }}
    )

    , sales_order_header_sales_reason as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )

    , joined as (
        select
            motivo_de_venda.pk_salesreasonid
            , sales_order_header_sales_reason.fk_salesreasonid
            , motivo_de_venda.nm_salesreason

        from sales_order_header_sales_reason 
        left join motivo_de_venda ON sales_order_header_sales_reason.fk_salesreasonid = motivo_de_venda.pk_salesreasonid
    )
    select *
    from joined