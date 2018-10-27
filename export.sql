--------------------------------------------------------
--  File created - wtorek-kwietnia-03-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRUCKS
--------------------------------------------------------

  CREATE TABLE "TRUCKS" 
   (	"PLATE_NR" VARCHAR2(20 BYTE), 
	"CAPACITY" NUMBER, 
	"RANGE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BUCKETS
--------------------------------------------------------

  CREATE TABLE "BUCKETS" 
   (	"BUCKET_ID" VARCHAR2(20 BYTE), 
	"DELIVERY_ADDRESS" VARCHAR2(40 BYTE), 
	"CHARGE" FLOAT(126)
   ) ;
--------------------------------------------------------
--  DDL for Table CLIENTS
--------------------------------------------------------

  CREATE TABLE "CLIENTS" 
   (	"EMAIL" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" VARCHAR2(20 BYTE), 
	"POSITION" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"WAREHOUSE_ID" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table LOADINGS
--------------------------------------------------------

  CREATE TABLE "LOADINGS" 
   (	"LOADING_NR" NUMBER, 
	"TIME" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SHELFS
--------------------------------------------------------

  CREATE TABLE "SHELFS" 
   (	"SHELF_ID" VARCHAR2(20 BYTE), 
	"BEARIG_CAPACITY" NUMBER, 
	"LENGTH" NUMBER, 
	"HIGHT" NUMBER, 
	"WIDTH" NUMBER, 
	"WAREHOUSE_ID" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SUPERVISING_TOWERS
--------------------------------------------------------

  CREATE TABLE "SUPERVISING_TOWERS" 
   (	"TOWER_ID" VARCHAR2(20 BYTE), 
	"PEOPLE_REQUIRED" NUMBER, 
	"SECTOR" VARCHAR2(20 BYTE), 
	"EMPLOYEE_ID" VARCHAR2(20 BYTE), 
	"WAREHOUSE_ID" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table TRANSPORTERS
--------------------------------------------------------

  CREATE TABLE "TRANSPORTERS" 
   (	"TRANSPORTER_ID" VARCHAR2(20 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"TOWER_ID" VARCHAR2(20 BYTE)
   ) ;
REM INSERTING into TRUCKS
SET DEFINE OFF;
REM INSERTING into BUCKETS
SET DEFINE OFF;
REM INSERTING into CLIENTS
SET DEFINE OFF;
REM INSERTING into EMPLOYEES
SET DEFINE OFF;
REM INSERTING into LOADINGS
SET DEFINE OFF;
REM INSERTING into SHELFS
SET DEFINE OFF;
REM INSERTING into SUPERVISING_TOWERS
SET DEFINE OFF;
REM INSERTING into TRANSPORTERS
SET DEFINE OFF;
