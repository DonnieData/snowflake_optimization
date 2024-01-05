ALTER SESSION SET USE_CACHED_RESULT = FALSE;
-- get spring and summer months working with fiscla year 


create or replace view warm_count_by_type_state as (
select "registration_state", "vehicle_body_type", count(*) count 
from (
select "issue_date"::date issue_date, *
from NYC_PARKING_VIOLATIONS_FY_23 
where 
    issue_date between '2022-07-01' and '2022-08-31'
    or 
    issue_date between '2023-04-01' and '2023-06-30'
 )
group by "registration_state", "vehicle_body_type"
order by "registration_state", count desc);


-- get fall and winter months working with fiscla year 
create or replace view cold_count_by_type_state as (

select "registration_state", "vehicle_body_type", count(*) count 
from (
select "issue_date"::date issue_date, *
from NYC_PARKING_VIOLATIONS_FY_23 
where 
    issue_date between '2022-09-01' and '2022-12-31'
    or 
    issue_date between '2023-01-01' and '2023-03-31'
 )
group by "registration_state", "vehicle_body_type"
order by "registration_state", count desc);


-- top day number that each precint gave a ticket
create or replace view top_ticket_day_by_precint as (
select 
"issuer_precinct", count
from
(select 
row_number() over(partition by "issuer_precinct" order by count desc) row_num,
"issuer_precinct",
count
from
(select "issuer_precinct", day("issue_date"::datetime) day, count(*) count
from NYC_PARKING_VIOLATIONS_FY_23
group by "issuer_precinct", day)
order by "issuer_precinct",count)
where row_num = 1 );


--word count in description 

with base_table as (
select 
descrip_array[0] index0,
descrip_array[1] index1,
descrip_array[2] index2,
descrip_array[3] index3,
descrip_array[4] index4,
descrip_array[5] index5,
descrip_array[6] index6
from (
select split("violation_description",' ') descrip_array
from 
 NYC_PARKING_VIOLATIONS_FY_23 
)),

layer_2 as (
select index0 descrip_words from base_table
union all
select index1 from base_table
union all
select index2 from base_table
union all
select index3 from base_table
union all
select index4 from base_table
union all
select index5 from base_table
union all
select index6 from base_table
)

select descrip_words, count(descrip_words) word_count from layer_2
group by descrip_words
order by word_count desc
;