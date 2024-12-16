with cte as(
select jsonb_array_elements(cleaning_receipts) as receipt from santarecords)
select receipt->>'drop_off' from cte where receipt->>'color' = 'green' and receipt->>'garment'='suit'
order by receipt->>'drop-off' desc limit 1;