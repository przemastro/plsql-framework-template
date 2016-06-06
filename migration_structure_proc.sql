alter session set current_schema=DB2;

--------------------------------------------------------
--  DDL for Procedure MIGRATION_STRUCTURE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "MIGRATION_STRUCTURE" AS 

tableQuery varchar2(1000);
alterTableQuery varchar2(500);
createIndexQuery varchar2(500);

BEGIN

--------------------------------------------------------
--  DDL for Table BPHOTOMETRY
--------------------------------------------------------
   tableQuery := 'CREATE TABLE BPHOTOMETRY 
                 (BPHOTOMETRYID NUMBER(*,0), 
                  BPHOTOMETRY VARCHAR2(50))';
   execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table BPHOTOMETRYTIME
--------------------------------------------------------
  tableQuery := 'CREATE TABLE BPHOTOMETRYTIME
                (BPHOTOMETRYTIMEID NUMBER(*,0), 
	               BPHOTOMETRYTIME VARCHAR2(50))';
  execute immediate tableQuery;
  

--------------------------------------------------------
--  DDL for Table LOG
--------------------------------------------------------
  tableQuery := 'CREATE TABLE LOG 
                (ID NUMBER(*,0), 
	               CREATEDATE TIMESTAMP (6), 
                 LOGCATEGORY VARCHAR2(50), 
	               LOGOBJECT VARCHAR2(50), 
	               MESSAGE VARCHAR2(200), 
	               OBSERVATIONID VARCHAR2(20))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table METADATACOMPARISON
--------------------------------------------------------
  tableQuery := 'CREATE TABLE METADATACOMPARISON 
                (ID NUMBER(*,0), 
	               METADATACOUNTSID NUMBER(*,0), 
	               STAGINGCOLUMN VARCHAR2(50), 
	               DELTACOLUMN VARCHAR2(50), 
	               DELTACOLUMNID VARCHAR2(50), 
	               PHOTOMETRYTABLE VARCHAR2(50), 
	               DATATYPECONVERSION VARCHAR2(1000), 
	               NULLVALUESCONVERSION VARCHAR2(100), 
	               JOINHINT VARCHAR2(50))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table METADATACOUNTS
--------------------------------------------------------
  tableQuery := 'CREATE TABLE METADATACOUNTS 
                (ID NUMBER(*,0), 
	               STAGINGTABLE VARCHAR2(50), 
	               DELTATABLE VARCHAR2(50))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table OBSERVATIONS
--------------------------------------------------------
  tableQuery := 'CREATE TABLE OBSERVATIONS
                (ID NUMBER(*,0), 
	               SOURCEROWID NUMBER(*,0), 
	               STARNAME VARCHAR2(50), 
	               STARTDATE VARCHAR2(50), 
	               ENDDATE VARCHAR2(50), 
	               UPHOTOMETRYID NUMBER(*,0), 
	               UPHOTOMETRYTIMEID NUMBER(*,0), 
	               VPHOTOMETRYID NUMBER(*,0), 
	               VPHOTOMETRYTIMEID NUMBER(*,0), 
	               BPHOTOMETRYID NUMBER(*,0), 
	               BPHOTOMETRYTIMEID NUMBER(*,0))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table STAGINGOBSERVATIONS
--------------------------------------------------------
  tableQuery := 'CREATE TABLE STAGINGOBSERVATIONS 
                (ID NUMBER(*,0), 
	               SOURCEROWID NUMBER(*,0), 
	               STARNAME VARCHAR2(50), 
	               STARTDATE DATE, 
                 ENDDATE DATE, 
	               UPHOTOMETRY VARCHAR2(50), 
	               UPHOTOMETRYTIME VARCHAR2(50), 
                 VPHOTOMETRY VARCHAR2(50), 
	               VPHOTOMETRYTIME VARCHAR2(50), 
	               BPHOTOMETRY VARCHAR2(50), 
	               BPHOTOMETRYTIME VARCHAR2(50), 
	               STATUS VARCHAR2(50), 
	               ACTIVE VARCHAR2(20))';
  execute immediate tableQuery;
   

--------------------------------------------------------
--  DDL for Table UPHOTOMETRY
--------------------------------------------------------
  tableQuery := 'CREATE TABLE UPHOTOMETRY 
                (UPHOTOMETRYID NUMBER(*,0), 
	               UPHOTOMETRY VARCHAR2(50))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table UPHOTOMETRYTIME
--------------------------------------------------------
  tableQuery := 'CREATE TABLE UPHOTOMETRYTIME 
                (UPHOTOMETRYTIMEID NUMBER(*,0), 
	               UPHOTOMETRYTIME VARCHAR2(50))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table VPHOTOMETRY
--------------------------------------------------------
  tableQuery := 'CREATE TABLE VPHOTOMETRY 
                (VPHOTOMETRYID NUMBER(*,0), 
	               VPHOTOMETRY VARCHAR2(50))';
  execute immediate tableQuery;
   
   
--------------------------------------------------------
--  DDL for Table VPHOTOMETRYTIME
--------------------------------------------------------
  tableQuery := 'CREATE TABLE VPHOTOMETRYTIME 
                (VPHOTOMETRYTIMEID NUMBER(*,0), 
	               VPHOTOMETRYTIME VARCHAR2(50))';
  execute immediate tableQuery;
  
  
--------------------------------------------------------
--  DDL for Index BPHOTOMETRY_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX BPHOTOMETRY_PK ON BPHOTOMETRY (BPHOTOMETRYID)';  
  execute immediate createIndexQuery;
  

--------------------------------------------------------
--  DDL for Index BPHOTOMETRYTIME_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX BPHOTOMETRYTIME_PK ON BPHOTOMETRYTIME (BPHOTOMETRYTIMEID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index LOG_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX LOG_PK ON LOG (ID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index METADATACOUNTS_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX METADATACOUNTS_PK ON METADATACOUNTS (ID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX TABLE1_PK ON METADATACOMPARISON (ID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index UPHOTOMETRY_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX UPHOTOMETRY_PK ON UPHOTOMETRY (UPHOTOMETRYID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index UPHOTOMETRYTIME_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX UPHOTOMETRYTIME_PK ON UPHOTOMETRYTIME (UPHOTOMETRYTIMEID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index VPHOTOMETRY_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX VPHOTOMETRY_PK ON VPHOTOMETRY (VPHOTOMETRYID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  DDL for Index VPHOTOMETRYTIME_PK
--------------------------------------------------------
  createIndexQuery := 'CREATE UNIQUE INDEX VPHOTOMETRYTIME_PK ON VPHOTOMETRYTIME (VPHOTOMETRYTIMEID)';
  execute immediate createIndexQuery;
  
  
--------------------------------------------------------
--  Constraints for Table BPHOTOMETRY
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE BPHOTOMETRY ADD CONSTRAINT BPHOTOMETRY_PK PRIMARY KEY (BPHOTOMETRYID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE BPHOTOMETRY MODIFY (BPHOTOMETRYID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table BPHOTOMETRYTIME
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE BPHOTOMETRYTIME ADD CONSTRAINT BPHOTOMETRYTIME_PK PRIMARY KEY (BPHOTOMETRYTIMEID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE BPHOTOMETRYTIME MODIFY (BPHOTOMETRYTIMEID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table LOG
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE LOG ADD CONSTRAINT LOG_PK PRIMARY KEY (ID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE LOG MODIFY (ID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table METADATACOMPARISON
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE METADATACOMPARISON ADD CONSTRAINT TABLE1_PK PRIMARY KEY (ID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE METADATACOMPARISON MODIFY (ID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table METADATACOUNTS
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE METADATACOUNTS ADD CONSTRAINT METADATACOUNTS_PK PRIMARY KEY (ID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE METADATACOUNTS MODIFY (ID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table OBSERVATIONS
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE OBSERVATIONS MODIFY (ID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table STAGINGOBSERVATIONS
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE STAGINGOBSERVATIONS MODIFY (ID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table UPHOTOMETRY
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE UPHOTOMETRY ADD CONSTRAINT UPHOTOMETRY_PK PRIMARY KEY (UPHOTOMETRYID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE UPHOTOMETRY MODIFY (UPHOTOMETRYID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table UPHOTOMETRYTIME
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE UPHOTOMETRYTIME ADD CONSTRAINT UPHOTOMETRYTIME_PK PRIMARY KEY (UPHOTOMETRYTIMEID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE UPHOTOMETRYTIME MODIFY (UPHOTOMETRYTIMEID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table VPHOTOMETRY
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE VPHOTOMETRY ADD CONSTRAINT VPHOTOMETRY_PK PRIMARY KEY (VPHOTOMETRYID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE VPHOTOMETRY MODIFY (VPHOTOMETRYID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
  
--------------------------------------------------------
--  Constraints for Table VPHOTOMETRYTIME
--------------------------------------------------------
  alterTableQuery := 'ALTER TABLE VPHOTOMETRYTIME ADD CONSTRAINT VPHOTOMETRYTIME_PK PRIMARY KEY (VPHOTOMETRYTIMEID) ENABLE';
  execute immediate alterTableQuery;
  alterTableQuery := 'ALTER TABLE VPHOTOMETRYTIME MODIFY (VPHOTOMETRYTIMEID NOT NULL ENABLE)';
  execute immediate alterTableQuery;
  
   
END MIGRATION_STRUCTURE;

/
