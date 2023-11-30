(select p.product_code,p.product,manufacturing_cost
from dim_product as p left join fact_manufacturing_cost as m
on p.product_code=m.product_code 
where manufacturing_cost is not null
order by manufacturing_cost desc 
limit 1)
union 
(select p.product_code,p.product,manufacturing_cost
from dim_product as p left join fact_manufacturing_cost as m
on p.product_code=m.product_code 
where manufacturing_cost is not null
order by manufacturing_cost 
limit 1 )

