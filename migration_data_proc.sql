alter session set current_schema=DB1;

--------------------------------------------------------
--  DDL for Procedure MIGRATION_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "MIGRATION_DATA" AS 

insertQuery varchar2(1000);

BEGIN

--------------------------------------------------------
--  DML for Table BPHOTOMETRY
--------------------------------------------------------
  insertQuery := 'insert into BPHOTOMETRY(BPHOTOMETRYID,BPHOTOMETRY) select * from DB1.BPHOTOMETRY';
  execute immediate insertQuery;


--------------------------------------------------------
--  DML for Table BPHOTOMETRYTIME
--------------------------------------------------------  
  insertQuery := 'insert into BPHOTOMETRYTIME(BPHOTOMETRYTIMEID,BPHOTOMETRYTIME) select * from DB1.BPHOTOMETRYTIME';
  execute immediate insertQuery;


--------------------------------------------------------
--  DML for Table UPHOTOMETRY
--------------------------------------------------------  
  insertQuery := 'insert into UPHOTOMETRY(UPHOTOMETRYID,UPHOTOMETRY) select * from DB1.UPHOTOMETRY';
  execute immediate insertQuery;


--------------------------------------------------------
--  DML for Table UPHOTOMETRYTIME
--------------------------------------------------------  
  insertQuery := 'insert into UPHOTOMETRYTIME(UPHOTOMETRYTIMEID,UPHOTOMETRYTIME) select * from DB1.UPHOTOMETRYTIME';
  execute immediate insertQuery;


--------------------------------------------------------
--  DML for Table VPHOTOMETRY
--------------------------------------------------------  
  insertQuery := 'insert into VPHOTOMETRY(VPHOTOMETRYID,VPHOTOMETRY) select * from DB1.VPHOTOMETRY';
  execute immediate insertQuery;
  
  
--------------------------------------------------------
--  DML for Table VPHOTOMETRYTIME
--------------------------------------------------------
  insertQuery := 'insert into VPHOTOMETRYTIME(VPHOTOMETRYTIMEID,VPHOTOMETRYTIME) select * from DB1.VPHOTOMETRYTIME';
  execute immediate insertQuery;


--------------------------------------------------------
--  DML for Table METADATACOMPARISON
--------------------------------------------------------  
  insertQuery := 'insert into METADATACOMPARISON(ID,METADATACOUNTSID,STAGINGCOLUMN,DELTACOLUMN,DELTACOLUMNID,PHOTOMETRYTABLE,DATATYPECONVERSION,NULLVALUESCONVERSION,JOINHINT) select * from DB1.METADATACOMPARISON';
  execute immediate insertQuery;
  
  
--------------------------------------------------------
--  DML for Table METADATACOUNTS
--------------------------------------------------------  
  insertQuery := 'insert into METADATACOUNTS(ID,STAGINGTABLE,DELTATABLE) select * from DB1.METADATACOUNTS';
  execute immediate insertQuery;
  
  
--------------------------------------------------------
--  DML for Table OBSERVATIONS
--------------------------------------------------------  
  insertQuery := 'insert into OBSERVATIONS(ID,SOURCEROWID,STARNAME,STARTDATE,ENDDATE,UPHOTOMETRYID,UPHOTOMETRYTIMEID,VPHOTOMETRYID,VPHOTOMETRYTIMEID,BPHOTOMETRYID,BPHOTOMETRYTIMEID) select * from DB1.OBSERVATIONS';
  execute immediate insertQuery;
  
  
--------------------------------------------------------
--  DML for Table STAGINGOBSERVATIONS
--------------------------------------------------------
  insertQuery := 'insert into STAGINGOBSERVATIONS(ID,SOURCEROWID,STARNAME,STARTDATE,ENDDATE,UPHOTOMETRY,UPHOTOMETRYTIME,VPHOTOMETRY,VPHOTOMETRYTIME,BPHOTOMETRY,BPHOTOMETRYTIME,ACTIVE,STATUS) select * from DB1.STAGINGOBSERVATIONS';
  execute immediate insertQuery;
  
END MIGRATION_DATA;

/
