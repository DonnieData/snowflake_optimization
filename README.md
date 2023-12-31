# snowflake_query


### report of load into job 


Snowflake 

- **worksheets**
  - op_architecture
  - 
- **warhouses**:
    - op_warehouse_xs
    - op_warehouse_s
    - op_warehouse_m
    - op_warehouse_l
- **database**
  - op_database 
    - **schema**
      - public
        - **tables**
          - nyc_payroll_data 


 
Query/ python to build results for report that is exported. 
- create downstream table/ views for report
- clear cache for testing and swithcing warehouses 


a report is refreshed daily, needs to be precise. since refreshed daily query cache is reset and full query block has to run.
