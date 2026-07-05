--------------------------------------------------------------------------
-- 00_create_user.sql
-- Creates a dedicated user/schema to hold the OE-style database, instead
-- of building everything under SYS.
--
-- Run this connected to the PLUGGABLE DATABASE as SYSDBA, e.g.:
--   sqlplus sys/YourPassword123@localhost:1521/FREEPDB1 as sysdba
-- or as a SYSDBA connection in an SQL editor.
--
-- In Oracle 23c (and 21c XE), user-created schemas belong in the PDB
-- (XEPDB1 by default), not in the CDB root. If you connect to the root
-- (service name CDB instead of FREEPDB1) this will fail with ORA-65096.
--
-- EDIT the username/password below before running.
--------------------------------------------------------------------------

CREATE USER oe_demo IDENTIFIED BY "ChangeMe123!"
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

-- Minimum privileges to connect and create objects (tables, sequences,
-- indexes, views, PL/SQL) under their own schema.
GRANT CREATE SESSION   TO oe_demo;
GRANT CREATE TABLE     TO oe_demo;
GRANT CREATE SEQUENCE  TO oe_demo;
GRANT CREATE VIEW      TO oe_demo;
GRANT CREATE PROCEDURE TO oe_demo;
GRANT CREATE TRIGGER   TO oe_demo;