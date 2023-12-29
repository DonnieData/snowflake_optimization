
--create database 
CREATE or REPLACE database op_database;

--create table for payroll data
create OR REPLACE TABLE op_database.public.nyc_payroll_data (
	"fiscal_year" VARCHAR(50),
	"payroll_number" VARCHAR(50),
	"agency_name" VARCHAR(50),
	"last_name" VARCHAR(50),
	"first_name" VARCHAR(50),
	"mid_init" VARCHAR(50),
	"agency_start_date" VARCHAR(50),
	"work_location_borough" VARCHAR(50),
	"title_description" VARCHAR(250),
	"leave_status_as_of_june_30" VARCHAR(50),
	"base_salary" VARCHAR(50),
	"pay_basis" VARCHAR(50),
	"regular_hours" VARCHAR(50),
	"regular_gross_paid" VARCHAR(50),
	"ot_hours" VARCHAR(50),
	"total_ot_paid" VARCHAR(50),
	"total_other_pay" VARCHAR(50)
);



COPY INTO BLUE4 
from @%BLUE4
FILE_FORMAT = ( SKIP_HEADER = 1 );

select * from BLUE4


--results from laod into job 
select * 
from table(RESULT_SCAN('01b141d3-0001-99d2-0002-73020002b09a'));

