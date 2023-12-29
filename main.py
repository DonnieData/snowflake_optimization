#get years in dataset
years = requests.get("https://data.cityofnewyork.us/resource/k397-673e.json?$select=distinct fiscal_year")
years = years.json()
years = [i['fiscal_year'] for i in years]
years.sort()




for i in years: 
    #define function variables 
    url = f"https://data.cityofnewyork.us/resource/k397-673e.json?$limit={300}&$where=fiscal_year={i}"
    #using dataset size as arbitrary limit
    response = requests.get(url)
    
    if response.status_code != 200:
        break 
    
    #save data to temp folder as csv    
    dataframe = pd.DataFrame(response.json())
    
    file_path = f'temp/{i}_data_sample.csv'
    
    #define dataframe format /coloumn order 
    cols_order = ['fiscal_year', 'payroll_number', 'agency_name', 'last_name',
       'first_name', 'mid_init', 'agency_start_date', 'work_location_borough',
       'title_description', 'leave_status_as_of_june_30', 'base_salary',
       'pay_basis', 'regular_hours', 'regular_gross_paid', 'ot_hours',
       'total_ot_paid', 'total_other_pay']
    
    #get current columns and check for #check for missing columns 
    current_cols = dataframe.columns.to_list()
    missing_cols = [i for i in cols_order if i not in current_cols]

    if len(missing_cols) > 0: 
        for x in missing_cols:
            dataframe[x] = np.nan
    
    print(f'{len(missing_cols)} in {i}')    
    
    #re-order columns 
    dataframe = dataframe[['fiscal_year', 'payroll_number', 'agency_name', 'last_name',
       'first_name', 'mid_init', 'agency_start_date', 'work_location_borough',
       'title_description', 'leave_status_as_of_june_30', 'base_salary',
       'pay_basis', 'regular_hours', 'regular_gross_paid', 'ot_hours',
       'total_ot_paid', 'total_other_pay']]

    #save dataframe 
    dataframe.to_csv(file_path, index=False)   
    
    print(len(dataframe.columns))
    print(f'{i}:rows:{len(dataframe)}')
    
    #stage file in snowflake 
    #con.cursor().execute(f'PUT file://{file_path}* @%BLUE4')
    
    #free up memory, clear out variable and delete temp file 
    dataframe = None
    #if os.path.isfile(file_path):
     #   os.remove(file_path)
    
    #
    #time.sleep(10)