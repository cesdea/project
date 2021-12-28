-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-06 18:00:56 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE USER scott IDENTIFIED BY DEFAULT TABLESPACE USERS ACCOUNT UNLOCK ;

GRANT UNLIMITED TABLESPACE TO SCOTT 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE scott.게시판 (
    작성자      VARCHAR2(10 BYTE),
    작성자_공개여부 CHAR(1 BYTE) NOT NULL,
    글_번호     NUMBER(38) NOT NULL,
    글이름      VARCHAR2(20 BYTE) NOT NULL,
    글제목      VARCHAR2(10 BYTE) NOT NULL,
    글내용      VARCHAR2(100 BYTE),
    해시태그     VARCHAR2(10 BYTE),
    추천수      NUMBER(38) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.게시판_pk ON
    scott.게시판 (
        글_번호
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE scott.게시판
    ADD CONSTRAINT 게시판_pk PRIMARY KEY ( 글_번호 )
        USING INDEX scott.게시판_pk;

CREATE TABLE 고객센터 (
    글번호 NUMBER(100) NOT NULL,
    글내용 VARCHAR2(100) NOT NULL,
    작성자 VARCHAR2(15)
)
LOGGING;

ALTER TABLE 고객센터 ADD CONSTRAINT 고객센터_pk PRIMARY KEY ( 글번호 );

CREATE TABLE 고객센터_답변 (
    답변_번호 NUMBER(100) NOT NULL,
    답변순서  NUMBER(100) NOT NULL,
    작성자   VARCHAR2(15),
    답변내용  VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE 고객센터_답변 ADD CONSTRAINT 고객센터_답변_pk PRIMARY KEY ( 답변_번호 );

CREATE TABLE 공지사항 (
    글번호 NUMBER(100) NOT NULL,
    작성자 VARCHAR2(15),
    글제목 VARCHAR2(100) NOT NULL,
    글내용 VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE 공지사항 ADD CONSTRAINT 공지사항_pk PRIMARY KEY ( 글번호 );

CREATE TABLE 공지사항_댓글 (
    공지사항_댓글_글번호 NUMBER(100) NOT NULL,
    작성자         VARCHAR2(15),
    작성자_공개여부    CHAR(1) NOT NULL,
    댓글_내용       VARCHAR2(100) NOT NULL,
    댓글_공개여부     CHAR(1) NOT NULL,
    댓글_순서       NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE 공지사항_댓글 ADD CONSTRAINT 공지사항_댓글_pk PRIMARY KEY ( 공지사항_댓글_글번호 );

CREATE TABLE 관리자 (
    관리자_id VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE 관리자 ADD CONSTRAINT 관리자_pk PRIMARY KEY ( 관리자_id );

CREATE TABLE scott.댓글 (
    댓글_글번호      NUMBER(10) NOT NULL,
    댓글_내용       VARCHAR2(100 BYTE),
    댓글_순서       NUMBER(30),
    댓글_답글       CHAR(1 BYTE),
    댓글_비밀글      CHAR(1 BYTE),
    댓글_작성자      VARCHAR2(15 BYTE),
    댓글_공개여부     CHAR(1 BYTE) NOT NULL,
    댓글_작성자_공개여부 CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.댓글_pk ON
    scott.댓글 (
        댓글_글번호
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE scott.댓글
    ADD CONSTRAINT 댓글_pk PRIMARY KEY ( 댓글_글번호 )
        USING INDEX scott.댓글_pk;

CREATE TABLE 유저 (
    유저_id VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE 유저 ADD CONSTRAINT 유저_pk PRIMARY KEY ( 유저_id );

ALTER TABLE scott.게시판
    ADD CONSTRAINT 게시판_유저_fk FOREIGN KEY ( 작성자 )
        REFERENCES 유저 ( 유저_id )
    NOT DEFERRABLE;

ALTER TABLE 고객센터_답변
    ADD CONSTRAINT 고객센터_답변_고객센터_fk FOREIGN KEY ( 답변_번호 )
        REFERENCES 고객센터 ( 글번호 )
    NOT DEFERRABLE;

ALTER TABLE 고객센터_답변
    ADD CONSTRAINT 고객센터_답변_관리자_fk FOREIGN KEY ( 작성자 )
        REFERENCES 관리자 ( 관리자_id )
    NOT DEFERRABLE;

ALTER TABLE 고객센터
    ADD CONSTRAINT 고객센터_유저_fk FOREIGN KEY ( 작성자 )
        REFERENCES 유저 ( 유저_id )
    NOT DEFERRABLE;

ALTER TABLE 공지사항
    ADD CONSTRAINT 공지사항_관리자_fk FOREIGN KEY ( 작성자 )
        REFERENCES 관리자 ( 관리자_id )
    NOT DEFERRABLE;

ALTER TABLE 공지사항_댓글
    ADD CONSTRAINT 공지사항_댓글_번호_fk FOREIGN KEY ( 공지사항_댓글_글번호 )
        REFERENCES 공지사항 ( 글번호 )
    NOT DEFERRABLE;

ALTER TABLE 공지사항_댓글
    ADD CONSTRAINT 공지사항_댓글_유저_fk FOREIGN KEY ( 작성자 )
        REFERENCES 유저 ( 유저_id )
    NOT DEFERRABLE;

ALTER TABLE scott.댓글
    ADD CONSTRAINT 댓글_글번호_pf FOREIGN KEY ( 댓글_글번호 )
        REFERENCES scott.게시판 ( 글_번호 )
    NOT DEFERRABLE;

ALTER TABLE scott.댓글
    ADD CONSTRAINT 댓글_유저_fk FOREIGN KEY ( 댓글_작성자 )
        REFERENCES 유저 ( 유저_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
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
