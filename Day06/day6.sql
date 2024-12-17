select 
c.name as child_name,
g.name as gift_name,
g.price as gift_price
from gifts g join children c 
on g.child_id=c.child_id 
where price>(select avg(price) from gifts)
order by price;