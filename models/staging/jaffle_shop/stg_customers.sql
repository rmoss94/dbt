select
    id as customer_id,
    first_name,
    last_name

from {{source('jaffle_shop','customers')}}

--RMOSS_DEV.jaffle_shop.customers