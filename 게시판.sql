-- ������ Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   ��ġ:        2021-10-06 18:00:56 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



CREATE USER scott IDENTIFIED BY DEFAULT TABLESPACE USERS ACCOUNT UNLOCK ;

GRANT UNLIMITED TABLESPACE TO SCOTT 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE scott.�Խ��� (
    �ۼ���      VARCHAR2(10 BYTE),
    �ۼ���_�������� CHAR(1 BYTE) NOT NULL,
    ��_��ȣ     NUMBER(38) NOT NULL,
    ���̸�      VARCHAR2(20 BYTE) NOT NULL,
    ������      VARCHAR2(10 BYTE) NOT NULL,
    �۳���      VARCHAR2(100 BYTE),
    �ؽ��±�     VARCHAR2(10 BYTE),
    ��õ��      NUMBER(38) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.�Խ���_pk ON
    scott.�Խ��� (
        ��_��ȣ
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE scott.�Խ���
    ADD CONSTRAINT �Խ���_pk PRIMARY KEY ( ��_��ȣ )
        USING INDEX scott.�Խ���_pk;

CREATE TABLE ������ (
    �۹�ȣ NUMBER(100) NOT NULL,
    �۳��� VARCHAR2(100) NOT NULL,
    �ۼ��� VARCHAR2(15)
)
LOGGING;

ALTER TABLE ������ ADD CONSTRAINT ������_pk PRIMARY KEY ( �۹�ȣ );

CREATE TABLE ������_�亯 (
    �亯_��ȣ NUMBER(100) NOT NULL,
    �亯����  NUMBER(100) NOT NULL,
    �ۼ���   VARCHAR2(15),
    �亯����  VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE ������_�亯 ADD CONSTRAINT ������_�亯_pk PRIMARY KEY ( �亯_��ȣ );

CREATE TABLE �������� (
    �۹�ȣ NUMBER(100) NOT NULL,
    �ۼ��� VARCHAR2(15),
    ������ VARCHAR2(100) NOT NULL,
    �۳��� VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE �������� ADD CONSTRAINT ��������_pk PRIMARY KEY ( �۹�ȣ );

CREATE TABLE ��������_��� (
    ��������_���_�۹�ȣ NUMBER(100) NOT NULL,
    �ۼ���         VARCHAR2(15),
    �ۼ���_��������    CHAR(1) NOT NULL,
    ���_����       VARCHAR2(100) NOT NULL,
    ���_��������     CHAR(1) NOT NULL,
    ���_����       NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE ��������_��� ADD CONSTRAINT ��������_���_pk PRIMARY KEY ( ��������_���_�۹�ȣ );

CREATE TABLE ������ (
    ������_id VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE ������ ADD CONSTRAINT ������_pk PRIMARY KEY ( ������_id );

CREATE TABLE scott.��� (
    ���_�۹�ȣ      NUMBER(10) NOT NULL,
    ���_����       VARCHAR2(100 BYTE),
    ���_����       NUMBER(30),
    ���_���       CHAR(1 BYTE),
    ���_��б�      CHAR(1 BYTE),
    ���_�ۼ���      VARCHAR2(15 BYTE),
    ���_��������     CHAR(1 BYTE) NOT NULL,
    ���_�ۼ���_�������� CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.���_pk ON
    scott.��� (
        ���_�۹�ȣ
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE scott.���
    ADD CONSTRAINT ���_pk PRIMARY KEY ( ���_�۹�ȣ )
        USING INDEX scott.���_pk;

CREATE TABLE ���� (
    ����_id VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ����_id );

ALTER TABLE scott.�Խ���
    ADD CONSTRAINT �Խ���_����_fk FOREIGN KEY ( �ۼ��� )
        REFERENCES ���� ( ����_id )
    NOT DEFERRABLE;

ALTER TABLE ������_�亯
    ADD CONSTRAINT ������_�亯_������_fk FOREIGN KEY ( �亯_��ȣ )
        REFERENCES ������ ( �۹�ȣ )
    NOT DEFERRABLE;

ALTER TABLE ������_�亯
    ADD CONSTRAINT ������_�亯_������_fk FOREIGN KEY ( �ۼ��� )
        REFERENCES ������ ( ������_id )
    NOT DEFERRABLE;

ALTER TABLE ������
    ADD CONSTRAINT ������_����_fk FOREIGN KEY ( �ۼ��� )
        REFERENCES ���� ( ����_id )
    NOT DEFERRABLE;

ALTER TABLE ��������
    ADD CONSTRAINT ��������_������_fk FOREIGN KEY ( �ۼ��� )
        REFERENCES ������ ( ������_id )
    NOT DEFERRABLE;

ALTER TABLE ��������_���
    ADD CONSTRAINT ��������_���_��ȣ_fk FOREIGN KEY ( ��������_���_�۹�ȣ )
        REFERENCES �������� ( �۹�ȣ )
    NOT DEFERRABLE;

ALTER TABLE ��������_���
    ADD CONSTRAINT ��������_���_����_fk FOREIGN KEY ( �ۼ��� )
        REFERENCES ���� ( ����_id )
    NOT DEFERRABLE;

ALTER TABLE scott.���
    ADD CONSTRAINT ���_�۹�ȣ_pf FOREIGN KEY ( ���_�۹�ȣ )
        REFERENCES scott.�Խ��� ( ��_��ȣ )
    NOT DEFERRABLE;

ALTER TABLE scott.���
    ADD CONSTRAINT ���_����_fk FOREIGN KEY ( ���_�ۼ��� )
        REFERENCES ���� ( ����_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             2
-- ALTER TABLE                             17
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
