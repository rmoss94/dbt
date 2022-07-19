with orders as (

    select * from {{ref('stg_orders')}}
),

payments as (

    select * from {{ref('stg_payments')}}
),

cust_order as (

    select distinct order_id, customer_id
    from orders
),

order_amount as (
    select order_id, case when status = 'success' then payments.amount end as amount
    from payments
),

final as (

    select * from cust_order
    left join order_amount using (order_id)
)

select * from final