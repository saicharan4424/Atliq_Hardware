with cte as(select p.product_code,fiscal_year
from dim_product as p left join fact_gross_price as f 
on p.product_code=f.product_code ),

cte1 as (select (select count(distinct(product_code)) from cte where fiscal_year=2020) as unique_products_2020,
(select count(distinct(product_code)) from cte where fiscal_year=2021) as unique_products_2021
from cte)
select unique_products_2020,unique_products_2021, ((unique_products_2020-unique_products_2021)*100)/(unique_products_2020) as percentage_change
from cte1
limit 1

