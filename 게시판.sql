-- ������ Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   ��ġ:        2021-10-05 21:11:31 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE qna (
    �ۼ��� VARCHAR2(15) NOT NULL
);

ALTER TABLE qna ADD CONSTRAINT qna_pk PRIMARY KEY ( �ۼ��� );
CREATE TABLE �Խ��� (
    �ۼ���        VARCHAR2(10)
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    �ۼ���_�������� CHAR(1) NOT NULL,
    ��_��ȣ     NUMBER(38) NOT NULL,
    ���̸�        VARCHAR2(20) NOT NULL,
    ������        VARCHAR2(10) NOT NULL,
    �۳���     VARCHAR2(100),
    �ؽ��±�       VARCHAR2(10),
    ��õ��        NUMBER(38) NOT NULL
);
ALTER TABLE �Խ��� ADD CONSTRAINT �Խ���_pk PRIMARY KEY (��_��ȣ);

CREATE TABLE ������ (
    �ۼ��� VARCHAR2(15) NOT NULL
);
ALTER TABLE ������ ADD CONSTRAINT ������_pk PRIMARY KEY ( �ۼ��� );

CREATE TABLE �������� (
    �ۼ���    VARCHAR2(10) 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    ������    VARCHAR2(100) NOT NULL,
    �۳���  VARCHAR2(100) NOT NULL
);

ALTER TABLE �������� ADD CONSTRAINT ��������_pk PRIMARY KEY ( �ۼ��� );

CREATE TABLE ��� (
    ���_�۹�ȣ      NUMBER(10)
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    ���_����       VARCHAR2(100),
    ���_����     NUMBER(30),
    ���_���     CHAR(1),
    ���_��б�    CHAR(1),
    ���_�ۼ���    VARCHAR2(15) NOT NULL,
    ���_��������     CHAR(1) NOT NULL,
    ���_�ۼ���_�������� CHAR(1) NOT NULL
);
ALTER TABLE ��� ADD CONSTRAINT ���_pk PRIMARY KEY ( ���_�۹�ȣ);

ALTER TABLE ���
    ADD CONSTRAINT ���_�۹�ȣ_pf FOREIGN KEY ( ���_�۹�ȣ )
        REFERENCES �Խ��� ( ��_��ȣ );



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
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
-- ERRORS                                   3
-- WARNINGS                                 0
