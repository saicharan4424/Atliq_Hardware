select c.customer_code,c.customer,round(avg(pre_invoice_discount_pct*100),2) as average_discount_percentage 
from dim_customer as c left join fact_pre_invoice_deductions as i 
on c.customer_code = i.customer_code 
where fiscal_year="2021" and market="India" 
group by c.customer_code,c.customer
order by average_discount_percentage desc 
limit 5
