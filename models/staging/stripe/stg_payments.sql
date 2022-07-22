select
orderid as order_id,
id as payment_id,
{{cents_to_dollars('amount')}} as amount,
created AS CreatedDate,
status,
paymentmethod as payment_method

from {{source('stripe','payment')}}

--RMOSS_DEV.stripe.payment