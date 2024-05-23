with
    fonte_address as (
        select 
            cast(ADDRESSID as int) as pk_address
            , cast(ADDRESSLINE1 as varchar) as addressline1
            , cast(ADDRESSLINE2 as varchar) as addressline2
            , cast(CITY  as varchar) as city
            , cast(STATEPROVINCEID as int) as fk_stateprovince
            , cast(POSTALCODE as varchar) as postalcode
            , cast(SPATIALLOCATION as varchar(255)) as spatiallocation -- Ajuste para armazenar como texto
            , cast(ROWGUID as varchar(36)) as rowguid_adress -- Ajuste para GUID/UUID
            , cast(MODIFIEDDATE as date) as modifieddate_address
        from {{ source('ERP', 'ADDRESS') }}
    )

select *
from fonte_address