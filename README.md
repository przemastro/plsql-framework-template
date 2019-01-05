# PL/SQLFramework
Oracle XE 11g

This is a demo version of a framework I used for testing migration between oracle databases during development of an application for Roche Pharmaceuticals. In this little example I simulate migration between DB's using oracle schemas

DB consists of:

Tablespace

    1. plsqlFramework.dbf

Schemas

    1. DB1
    2. DB2

Tables in DB1

    1. stagingObservations - id, rowId, starName, startDate, endDate, uPhotometry, uPhotometryTime, vPhotometry, vPhotometryTime, bPhotometry, bPhotometryTime, Status, Active
    2. observations - id, rowId, starName, startDate, endDate, uPhotometryId, uPhotometryTimeId, vPhotometryId, vPhotometryTimeId, bPhotometryId, bPhotometryTimeId
    3. uPhotometry - uPhotometryId, uPhotometry
    4. vPhotometry - bPhotometryId, vPhotometry
    5. bPhotometry - bPhotometryId, bPhotometry
    6. uPhotometryTime - uPhotometryTimeId, uPhotometryTime
    7. vPhotometryTime - vPhotometryTimeId, vPhotometryTime
    8. bPhotometryTime - bPhotometryTimeId, bPhotometryTime
    9. log - id, procName, starDate, endDate, Message
    10.TestData
    11.metadataCounts
    12.metadataComparison

Migration Procedures in DB2

    1. MIGRATION_STRUCTURE
    2. MIGRATION_DATA

Anonymous Blocks

    1. report.sql

Queries

    1. tablespace.sql - to create tablespace for schemas
    2. migration_data_proc.sql - to create or replace migration procedure
    3. migration_structure_proc.sql - to create or replace migration procedure
    4. DB1.sql - to populate DB1 schema

