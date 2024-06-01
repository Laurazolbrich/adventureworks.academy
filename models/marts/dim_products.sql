with 
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , productphoto as (
        select *
        from {{ ref('stg_erp__productproductphoto') }}
    )

    , offer as (
        select *
        from {{ ref('stg_erp__specialofferproduct') }}   
    )
      
    , joined as (
        select 
            product.pk_product
            , product.nm_product 
        from product 
        left join productphoto on product.pk_product = productphoto.fk_product
        left join offer on productphoto.fk_product = offer.fk_product	 
    ) 
      
    , transformations as (
          select
              row_number() over (order by pk_product) as sk_produto
              , *     
          from joined
    )
      
select *
from transformations
