with cte as(select c.channel,c.customer_code,f.sold_quantity,f.fiscal_year,f.product_code,pid.pre_invoice_discount_pct
from dim_customer as c left join fact_sales_monthly as f 
on c.customer_code = f.customer_code left join fact_pre_invoice_deductions as pid 
on f.customer_code=pid.customer_code
where f.fiscal_year="2021"),
cte1 as (select channel,customer_code,sold_quantity,fgp.fiscal_year,fgp.product_code,fgp.gross_price,pre_invoice_discount_pct
from cte left join fact_gross_price as fgp 
on cte.product_code=fgp.product_code )

select channel,sum(sold_quantity*gross_price) as gross_sales_mln,(sum(sold_quantity*gross_price)*100)/(select sum(sold_quantity*gross_price) from cte1 ) as percentage
from cte1 
group by channel
order by gross_sales_mln desc
