-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-11-01 22:50:20 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE USER stock IDENTIFIED BY ACCOUNT UNLOCK ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE stock.customer (
    cus_id                VARCHAR2(30 BYTE) NOT NULL,
    cus_pwd               VARCHAR2(30 BYTE),
    cus_nickname          VARCHAR2(30 BYTE),
    cus_email             VARCHAR2(30 BYTE),
    cus_registration_date DATE,
    cus_num               NUMBER(10)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX stock.cus_id_pk ON
    stock.customer (
        cus_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE stock.customer
    ADD CONSTRAINT cus_id_pk PRIMARY KEY ( cus_id )
        USING INDEX stock.cus_id_pk;

CREATE TABLE stock.manager (
    man_id   VARCHAR2(30 BYTE) NOT NULL,
    man_pwd  VARCHAR2(30 BYTE),
    man_name VARCHAR2(30 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX stock.man_id_pk ON
    stock.manager (
        man_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX stock.man_name_uk ON
    stock.manager (
        man_name
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE stock.manager
    ADD CONSTRAINT man_id_pk PRIMARY KEY ( man_id )
        USING INDEX stock.man_id_pk;

ALTER TABLE stock.manager
    ADD CONSTRAINT man_name_uk UNIQUE ( man_name )
        USING INDEX stock.man_name_uk;

CREATE TABLE stock.service (
    s_id      NUMBER(10) NOT NULL,
    s_content VARCHAR2(100 BYTE),
    s_name    VARCHAR2(30 BYTE),
    s_uid     VARCHAR2(30 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX stock.s_id_pk ON
    stock.service (
        s_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE stock.service
    ADD CONSTRAINT s_id_pk PRIMARY KEY ( s_id )
        USING INDEX stock.s_id_pk;

CREATE TABLE stock.service_answer (
    s_a_id      NUMBER(10) NOT NULL,
    s_a_ref     NUMBER(10),
    s_a_name    VARCHAR2(15 BYTE),
    s_a_content VARCHAR2(100 BYTE),
    s_a_uid     VARCHAR2(30 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX stock.s_a_id_pk ON
    stock.service_answer (
        s_a_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE stock.service_answer
    ADD CONSTRAINT s_a_id_pk PRIMARY KEY ( s_a_id )
        USING INDEX stock.s_a_id_pk;

ALTER TABLE stock.service_answer
    ADD CONSTRAINT s_a_id_fk FOREIGN KEY ( s_a_id )
        REFERENCES stock.service ( s_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             5
-- ALTER TABLE                              6
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
-- CREATE USER                              1
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
