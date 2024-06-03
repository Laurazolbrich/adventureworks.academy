with
    person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , person_card as (
        select *
        from {{ ref('stg_erp__personcreditcard') }}
    )

    , credit_card as (
    select *
    from {{ ref('stg_erp__creditcard') }}
    )

    , joined as (
        select
            person.PK_BUSINESSENTITY
            , person.firstname
            , person.middlename
            , person.lastname
            , person_card.fk_creditcard
            , credit_card.cardtype
        from person
        left join  person_card on person.pk_businessentity =  person_card.fk_businessentity
        left join  credit_card on person_card.fk_creditcard =  credit_card.pk_creditcard
    )

    , transformations as (
          select
              row_number() over (order by pk_businessentity ) as sk_businessentity_id
              , *     
          from joined
    )
      
select *
from transformations
