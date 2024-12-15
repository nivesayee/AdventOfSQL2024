with cte as (
select date,sum(case when drink_name='Eggnog' then quantity else 0 end) as eggnog,
sum(case when drink_name='Hot Cocoa' then quantity else 0 end) as hotcocoa,
sum(case when drink_name='Peppermint Schnapps' then quantity else 0 end) as peppermintschnapps from drinks
group by date
)
select * from cte where hotcocoa=38 and peppermintschnapps=298 and eggnog=198;