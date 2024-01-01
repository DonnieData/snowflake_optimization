
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



CREATE OR REPLACE TABLE op_database.public.nyc_parking_violations_fy_23 ( 
"summons_number" VARCHAR(50),
 "plate_id" VARCHAR(50),
 "registration_state" VARCHAR(50),
 "plate_type" VARCHAR(50),
 "issue_date" VARCHAR(50),
 "violation_code" VARCHAR(50),
 "vehicle_body_type" VARCHAR(50),
 "vehicle_make" VARCHAR(50),
 "issuing_agency" VARCHAR(50),
 "street_code1" VARCHAR(50),
 "street_code2" VARCHAR(50),
 "street_code3" VARCHAR(50),
 "vehicle_expiration_date" VARCHAR(50),
 "violation_location" VARCHAR(50),
 "violation_precinct" VARCHAR(50),
 "issuer_precinct" VARCHAR(50),
 "issuer_code" VARCHAR(50),
 "issuer_command" VARCHAR(50),
 "issuer_squad" VARCHAR(50),
 "violation_time" VARCHAR(50),
 "time_first_observed" VARCHAR(50),
 "violation_county" VARCHAR(50),
 "violation_in_front_of_or" VARCHAR(50),
 "house_number" VARCHAR(50),
 "street_name" VARCHAR(50),
 "intersecting_street" VARCHAR(50),
 "date_first_observed" VARCHAR(50),
 "law_section" VARCHAR(50),
 "sub_division" VARCHAR(50),
 "violation_legal_code" VARCHAR(50),
 "days_parking_in_effect" VARCHAR(50),
 "from_hours_in_effect" VARCHAR(50),
 "to_hours_in_effect" VARCHAR(50),
 "vehicle_color" VARCHAR(50),
 "unregistered_vehicle" VARCHAR(50),
 "vehicle_year" VARCHAR(50),
 "meter_number" VARCHAR(50),
 "feet_from_curb" VARCHAR(50),
 "violation_post_code" VARCHAR(50),
 "violation_description" VARCHAR(50),
 "no_standing_or_stopping" VARCHAR(50),
 "hydrant_violation" VARCHAR(50),
 "double_parking_violation" VARCHAR(50)

)



--load data into table 
COPY INTO nyc_payroll_data 
from @%nyc_payroll_data
FILE_FORMAT = ( SKIP_HEADER = 1 )
on_error = 'continue';

a
--results from laod into job 
select * 
from table(RESULT_SCAN('01b141d3-0001-99d2-0002-73020002b09a'));

