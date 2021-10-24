-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-24 12:12:52 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cus_id                VARCHAR2(30 BYTE) NOT NULL,
    cus_pwd               VARCHAR2(30 BYTE),
    cus_nickname          VARCHAR2(30 BYTE),
    cus_email             VARCHAR2(30 BYTE),
    cus_registration_date DATE,
    cus_num               NUMBER(10)
);

ALTER TABLE customer ADD CONSTRAINT cus_id_pk PRIMARY KEY ( cus_id );

CREATE TABLE manager (
    man_id   VARCHAR2(30 BYTE) NOT NULL,
    man_pwd  VARCHAR2(30 BYTE),
    man_name VARCHAR2(30 BYTE)
);

ALTER TABLE manager ADD CONSTRAINT man_id_pk PRIMARY KEY ( man_id );

ALTER TABLE manager ADD CONSTRAINT man_name_uk UNIQUE ( man_name );

CREATE TABLE service (
    s_id      NUMBER(10) NOT NULL,
    s_content VARCHAR2(100 BYTE),
    s_name    VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE service ADD CONSTRAINT s_id_pk PRIMARY KEY ( s_id );

CREATE TABLE service_answer (
    s_a_id      NUMBER(10) NOT NULL,
    s_a_ref     NUMBER(10) NOT NULL,
    s_a_name    VARCHAR2(15 BYTE) NOT NULL,
    s_a_content VARCHAR2(100 BYTE)
);

ALTER TABLE service_answer ADD CONSTRAINT s_a_id_pk PRIMARY KEY ( s_a_id );

ALTER TABLE service_answer
    ADD CONSTRAINT s_a_name_fk FOREIGN KEY ( s_a_name )
        REFERENCES manager ( man_name );

ALTER TABLE service_answer
    ADD CONSTRAINT s_a_ref_fk FOREIGN KEY ( s_a_ref )
        REFERENCES service ( s_id );

ALTER TABLE service
    ADD CONSTRAINT s_name_fk FOREIGN KEY ( s_name )
        REFERENCES manager ( man_name );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
