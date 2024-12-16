select split_part(unnest(email_addresses),'@',2) as domain,count(*) from contact_list
group by domain
order by count desc limit 1;