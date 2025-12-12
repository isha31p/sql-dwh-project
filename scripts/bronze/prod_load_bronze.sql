/* 
-------------------------------------------------------------------------------------
Stored procedure: load bronze layer( source --> bronze)
-------------------------------------------------------------------------------------
Script purpose:
This storage procedure loads data into 'bronze' schema from externam csv files.
Performed actions:
1. truncate the table before loading the data
2. use bulk insert command to load data from external csv filee to bronze tables.
-------------------------------------------------------------------------------------
Parameter:
This stored procedure does not accept any parameter or return any values.
---------------------------------------------------------------------------------------
to get the output together of all the tables that inserted 
-->   exec bronze.load_bronze
----------------------------------------------------------------------------------------
*/

create or alter procedure bronze.load_bronze as 
begin
begin try

print '=============================================================='
print 'loading bronze layer'
print '=============================================================='

print '--------------------------------------------------------------'
print 'loading crm tables'
print '--------------------------------------------------------------'

truncate table bronze.crm_cust_info;

print 'inserting data into bronze.crm_cust_info'
bulk insert bronze.crm_cust_info
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
with (
firstrow=2,
fieldterminator = ',',
tablock
);

print '------------------------------------------------'
truncate table bronze.crm_prd_info;

print 'inserting data into bronze.crm_prd_info'
bulk insert bronze.crm_prd_info
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
with (
firstrow=2,
fieldterminator = ',',
tablock
);

print'-------------------------------------------'
truncate table bronze.crm_sales_details;

print 'inserting data into bronze.crm_sales_details'
bulk insert bronze.crm_sales_details
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
with (
firstrow=2,
fieldterminator = ',',
tablock
);

print '--------------------------------------------------------------'
print 'loading erp tables'
print '--------------------------------------------------------------'


truncate table bronze.erp_loc_a101;

print 'inserting data into bronze.erp_loc_a101'
bulk insert bronze.erp_loc_a101
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
with(
firstrow = 2,
fieldterminator= ',',
tablock
);

print '--------------------------------------------------'
truncate table bronze.erp_cust_az12;

print 'inserting data into bronze.erp_cust_az12'
bulk insert bronze.erp_cust_az12
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
with(
firstrow = 2,
fieldterminator= ',',
tablock
);

print '-----------------------------------------------'
truncate table bronze.erp_px_cat_g1v2;

print 'inserting data into bronze.erp_px_cat_g1v2'
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\arunp\Desktop\dwm project\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
with(
firstrow = 2,
fieldterminator= ',',
tablock
);
end try

begin catch 
print '================================'
print 'error occured during loading'
print 'error msg' + error_message();
print 'error number' + cast(error_number() as nvarchar);
print '================================'
end catch

end


