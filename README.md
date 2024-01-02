# snowflake_query


### report of load into job 


Snowflake 
working with enterprise level - differnece between levels

**snowflake summary**
- is elt platform vs elt
- scales sotrage(data storage)  and compute(queires and jobs) to whatever you need.
    - can select payment option for sotrage scaling "on demand"  which are slightly higher price or lower price for set ammont.

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
