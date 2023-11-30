with cte as ( select d.product_code, segment,fiscal_year
from dim_product as d left join fact_gross_price as f 
on d.product_code=f.product_code),
cte1 as ( select segment, count(distinct(product_code)) as count2020
from cte 
where fiscal_year=2020
group by segment) ,
cte2 as ( select segment, count(distinct(product_code)) as count2021
from cte 
where fiscal_year=2021
group by segment) 
select cte1.segment,count2020,count2021, count2020-count2021 as changes
from cte1 left join cte2
on cte1.segment=cte2.segment 

