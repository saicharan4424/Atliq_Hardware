with cte as (select division,p.product_code,p.product,sum(sold_quantity) as total_quantity 
from dim_product as p right join fact_sales_monthly as s  #if left join use where clause to neglect nulls 
on p.product_code=s.product_code 
where fiscal_year=2021
group by division,p.product_code,p.product
order by total_quantity desc) ,

cte1 as (select *,dense_rank() over(partition by division order by total_quantity desc) as rank_order 
from cte )
# where total_quantity is not null) #here 


select * from cte1 where rank_order in (1,2,3) 

