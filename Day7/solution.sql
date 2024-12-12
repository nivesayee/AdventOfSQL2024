with min_and_max as (
select primary_skill,min(years_experience) as min_years,max(years_experience) as max_years from workshop_elves group by primary_skill),
min_max_elves as (
select w.* from workshop_elves w join min_and_max m on w.primary_skill=m.primary_skill and (w.years_experience=m.min_years or w.years_experience=m.max_years)),
pair_cte as (
select m1.elf_id as elf_1_id,m2.elf_id as elf_2_id,m1.primary_skill as shared_skill from min_max_elves m1 join min_max_elves m2 on m1.primary_skill = m2.primary_skill 
and m1.elf_id<>m2.elf_id 
and m1.years_experience > m2.years_experience),
ranked_cte as(
select *,rank() over(partition by shared_skill order by elf_1_id,elf_2_id) as rnk from pair_cte)
select * from ranked_cte where rnk=1;