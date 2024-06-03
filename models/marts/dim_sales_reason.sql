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
            , motivo_header.fk_salesorderid
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