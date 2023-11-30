with cte as(select fsm.*
from dim_customer as c left join fact_sales_monthly as fsm 
on c.customer_code=fsm.customer_code 
where c.customer="Atliq Exclusive"), 
cte1 as (
select month(date) as month, year(date) as year, cte.sold_quantity*gross_price as sale
from cte left join fact_gross_price as fgp 
on cte.product_code=fgp.product_code ) 
select month,year,sum(sale) as gross_sale_amount
from cte1 
group by month,year
order by year,month