with cte as(select p.product_code,segment,fiscal_year
from dim_product as p left join fact_gross_price as f 
on p.product_code=f.product_code ),

cte1 as (select segment,(select count(distinct(product_code)) from cte where fiscal_year=2020) as product_count_2020,
(select count(distinct(product_code)) from cte where fiscal_year=2021) as product_count_2021
from cte
group by segment )
select *, (product_count_2020-product_count_2021) as difference 
from cte1
