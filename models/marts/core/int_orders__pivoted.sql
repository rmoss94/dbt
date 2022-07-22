with payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
{% set payment_methods= ['bank_transfer', 'coupon', 'gift_card', 'credit_card'] -%}

select
    order_id,
    {% for names in payment_methods -%}
    sum(case when payment_method='{{names}}' then amount else 0 end) as {{names}}_amount

    {%- if not loop.last -%}
    ,
    {% endif -%}
    {%- endfor %}

    from payments
    where status = 'success'
    group by 1
)
select * from final