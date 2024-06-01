with
    fonte_productproductphoto as (
        select
            cast(productid as int) as product_id						
            , cast(productphotoid as int) fk_product				
        from {{ source('ERP', 'PRODUCTPRODUCTPHOTO') }}
    )
select *
from fonte_productproductphoto

