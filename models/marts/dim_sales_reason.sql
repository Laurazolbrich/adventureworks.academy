with 
    motivo as (
        select *
        from {{ ref('stg_erp__salesreason') }}
    )

    , motivo_header as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason')}}
    )
    , uniao_tabelas as (
        select 
           motivo.pk_salesreasonid 
            , motivo_header.pk_salesorderid
            , motivo.nm_salesreason
        from motivo
        left join motivo_header on motivo.pk_salesreasonid = motivo_header.fk_salesreasonid
    ) 
   
    , transformacoes as (
          select
              row_number() over (order by pk_salesreasonid) as sk_salesreasonid
              , *     
          from uniao_tabelas
    )
     
    select *
    from transformacoes





















-- with
--    motivo_de_venda as (
--        select *
--        from {{ ref('stg_erp__salesreason') }}
--    ),
--
--    sales_order_header_sales_reason as (
--        select *
--        from {{ ref('stg_erp__salesorderheadersalesreason') }}
--    ),
--
--    joined as (
--        select
--            motivo_de_venda.pk_salesreasonid,
--            sales_order_header_sales_reason.fk_salesreasonid,
--            motivo_de_venda.nm_salesreason,
--            motivo_de_venda.reasontype_salesreason
--        from sales_order_header_sales_reason 
--        left join motivo_de_venda 
--        ON sales_order_header_sales_reason.fk_salesreasonid = motivo_de_venda.pk_salesreasonid
--    )
--
--select
--    fk_salesreasonid as salesreasonid,
--    nm_salesreason,
--    reasontype_salesreason
--from joined
--group by
--    fk_salesreasonid,
--    nm_salesreason,
--    reasontype_salesreason
--