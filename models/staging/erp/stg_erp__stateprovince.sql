with
    fonte_stateprovince as (
        select
            cast(STATEPROVINCEID as int) as pk_stateprovince
            ,cast(STATEPROVINCECODE as varchar) as state
            ,cast(COUNTRYREGIONCODE as varchar) as fk_countryregioncode
            ,cast(ISONLYSTATEPROVINCEFLAG as boolean) as isonlystateprovinceflag -- Indicador booleano
            ,cast(NAME as varchar) as nm_state
            ,cast(TERRITORYID as int) as territoryid
            ,cast(ROWGUID as varchar(36)) as rowguid_stateprovince -- Ajuste para GUID/UUID
            ,cast(MODIFIEDDATE as date) as modifieddate_stateprovince
        from {{ source('ERP', 'STATEPROVINCE') }}
    )

select *
from fonte_stateprovince
