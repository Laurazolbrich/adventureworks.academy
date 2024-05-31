with
    Endereco as (
        select * 
        from {{ ref('stg_erp__address') }}
    )

    , Estado as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    )

    , Pais as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    )

    , joined as (
        select
            Endereco.pk_address
            , Endereco.addressline
            , Endereco.city
            , Estado.state
            , Estado.nm_state           
            , Estado.fk_countryregioncode 
            , pais.nm_country                         
            , Endereco.fk_stateprovince
           -- , Endereco.MODIFIEDDATE_ADDRESS
          --  , Estado.MODIFIEDDATE_STATEPROVINCE
           -- , pais.MODIFIEDDATE_COUNTRYREGION
        from Endereco
        left join Estado on Endereco.FK_STATEPROVINCE = Estado.PK_STATEPROVINCE
        left join Pais on Estado.FK_COUNTRYREGIONCODE = Pais.PK_COUNTRYREGION
    )

    , transformacoes as (
        select
             row_number() over (order by FK_STATEPROVINCE) as SK_STATEPROVINCE_ID
             , *     
        from joined 
    )
      
select *
from transformacoes