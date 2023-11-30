with cte as(select *,month(date) as month,year(date) as year 
from fact_sales_monthly) 
select sum(sold_quantity) as total_sold_quantity,
case 
when month>=1 and month<=3 then 1 
when month>=4 and month<=6 then 2 
when month>=7 and month<=9 then 3 
when month>=10 and month<12 then 4 
end as quarter 
from cte where year="2020" 
group by quarter 
order by total_sold_quantity desc
