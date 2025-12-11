/* create database and schemas
first create a database named datawarehouse then for using that database write,,,use <database_name> and
in that database create schemas named...bronze,silver and gold.
*/

create database datawarehouse;

use datawarehouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go
