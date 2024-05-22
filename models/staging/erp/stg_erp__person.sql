with 
    fonte_person as (
        select 
            cast(BUSINESSENTITYID as int) as pk_businessentity
            , cast(PERSONTYPE as varchar) as persontype
            , cast(FIRSTNAME as varchar) as firstname
            , cast(MIDDLENAME as varchar) as middlename
            , cast(LASTNAME as varchar) as lastname
            , cast(MODIFIEDDATE as date) as modifieddate_person
        from {{ source('ERP', 'PERSON') }}
    )

select *
from fonte_person
