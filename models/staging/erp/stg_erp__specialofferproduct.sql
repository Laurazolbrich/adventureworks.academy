with
    fonte_special_offer_product as(
        select
            cast(specialofferid	as int) as specialoffer_id		
            , cast(productid as int) as fk_product			
        from {{ source('ERP','SPECIALOFFERPRODUCT') }}
    )
select *
from fonte_special_offer_product