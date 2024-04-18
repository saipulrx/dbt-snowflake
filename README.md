# Hands On dbt and Snowflake 
This repository for course dbt and snowflake in digitalskola. Make sure to have snowflake account with **ACCOUNTADMIN** for participate this hands on(register free 1 month free trial snowflake without credit card)

## Table of Content
1) Install dbt core and dbt-snowflake
2) Setup snowflake connection for dbt
3) Testing dbt installation
4) Setup dbt with snowflake as data platform
5) Testing dbt connection
6) ELT Data Architecture & Data Modelling
7) Upload raw data files
8) Create Models
9) Create Test
10) Create documentations

### Install dbt core and dbt-snowflake
#### Install using pip and virtual environments

- Create a new venv
  ```
  python -m venv dbt-env              # create the environment
  ```
- Activate that same virtual environment each time you create a shell window or session:
  ```
  source dbt-env/bin/activate         # activate the environment for Mac and Linux OR
  dbt-env\Scripts\activate            # activate the environment for Windows
  ```

#### Install dbt-snowflake
There are many data platform adapter that support dbt but in this course is using Snowflake
```
python -m pip install dbt-snowflake
```

### Setup Snowflake Connection for dbt
Please refer to [Snowflake Configs](https://docs.getdbt.com/docs/core/connect-data-platform/snowflake-setup#authentication-methods)

### Testing dbt installation
Type command bellow in terminal or command line to testing are dbt is succcessfully installed
```
dbt --version
```

### Setup dbt with snowflake as data platform
- Go to snowflake query editor and run all query bellow in worksheet or you can copy paste ...
```
-------------------------------------------
-- dbt credentials
-------------------------------------------
USE ROLE securityadmin;
-- dbt roles
CREATE OR REPLACE ROLE dbt_dev_role;
------------------------------------------- Please replace with your dbt user password
CREATE OR REPLACE USER dbt_user PASSWORD = "<your_secret_password>";

GRANT ROLE dbt_dev_role TO USER dbt_user;
GRANT ROLE dbt_dev_role TO ROLE sysadmin;

-------------------------------------------
-- dbt objects
-------------------------------------------
USE ROLE sysadmin;

CREATE OR REPLACE WAREHOUSE dbt_dev_wh  WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1 INITIALLY_SUSPENDED = TRUE;

GRANT ALL ON WAREHOUSE dbt_dev_wh TO ROLE dbt_dev_role;

CREATE OR REPLACE DATABASE dbt_dev; 
GRANT ALL ON DATABASE dbt_dev  TO ROLE dbt_dev_role;
GRANT ALL ON ALL SCHEMAS IN DATABASE dbt_dev TO ROLE dbt_dev_role;
```

- Run dbt cli to init dbt with Snowflake as data platform
```
dbt init <your project name>
```
- Choose snowflake for database
- Choose password
- Input password
- Input role : dbt_rev_role
- Input warehouse name : dbt_dev_wh
- Input database name : dbt_dev
- Input schema : public
- Input threads : 200

### Testing dbt connection

Type command bellow in terminal or command line to testing are dbt can connect to BigQuery or other data platform
```
dbt debug
```
Also don't forget to copy dbt_project.yml to your dbt project folder location

### ELT Data Architecture & Data Modelling
#### ELT Data Architecture
![data_architecture]

#### Data Modelling
In this course, for Data Modelling use Kimbal's Method - Star Schema

<b>ERD Conceptual</b>
![erd conceptual]

<b>ERD Logical</b>
![erd logical]

<b>ERD Physical</b>
<br />
![erd physical]

### Upload Raw Data Files
- Upload Raw data csv files in folder seeds use dbt cli command 
```
dbt seed
```
- After that, there are new table in raw dataset

### Create Models
Copy paste all folder staging and warehouse to your local then run
```
dbt run
```

### Create Test
- Create schema.yml under models/warehouse and copy paste bellow code
```
version: 2

models:
    - name: dim_product
      columns:              
          - name: product_id
            tests:
                - not_null
                - unique
```
- Run dbt cli bellow
```
dbt test
```

### Create Documentation
- Modify schema.yml under models/warehouse and copy paste bellow code
```
version: 2

models:
    - name: dim_product
      description: Cleansed table which contains list of products.
      columns:              
          - name: product_id
            description: Primary key for the product
            tests:
                - not_null
                - unique
          - name: product_code
            description: code of each product
            tests:
                - not_null
    - name: fact_inventory
      columns:
          - name: inventory_id
            description: Primary key for the fact inventory table
            tests:
                - not_null
                - unique
```
- Run dbt cli bellow for generate your project's documentation. 
```
dbt docs generate
```

- Run dbt cli bellow for display dbt webserver in browser. Default port is 8080 but you can use different port using --port flag 
```
dbt docs serve --port 8001
```
