select
orderid as order_id,
id as payment_id,
amount/100 as amount,
created AS CreatedDate,
status,
paymentmethod as payment_method

from RMOSS_DEV.stripe.payment