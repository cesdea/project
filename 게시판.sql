-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-05 21:11:31 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE qna (
    작성자 VARCHAR2(15) NOT NULL
);

ALTER TABLE qna ADD CONSTRAINT qna_pk PRIMARY KEY ( 작성자 );
CREATE TABLE 게시판 (
    작성자        VARCHAR2(10)
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    작성자_공개여부 CHAR(1) NOT NULL,
    글_번호     NUMBER(38) NOT NULL,
    글이름        VARCHAR2(20) NOT NULL,
    글제목        VARCHAR2(10) NOT NULL,
    글내용     VARCHAR2(100),
    해시태그       VARCHAR2(10),
    추천수        NUMBER(38) NOT NULL
);
ALTER TABLE 게시판 ADD CONSTRAINT 게시판_pk PRIMARY KEY (글_번호);

CREATE TABLE 고객센터 (
    작성자 VARCHAR2(15) NOT NULL
);
ALTER TABLE 고객센터 ADD CONSTRAINT 고객센터_pk PRIMARY KEY ( 작성자 );

CREATE TABLE 공지사항 (
    작성자    VARCHAR2(10) 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    글제목    VARCHAR2(100) NOT NULL,
    글내용  VARCHAR2(100) NOT NULL
);

ALTER TABLE 공지사항 ADD CONSTRAINT 공지사항_pk PRIMARY KEY ( 작성자 );

CREATE TABLE 댓글 (
    댓글_글번호      NUMBER(10)
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    댓글_내용       VARCHAR2(100),
    댓글_순서     NUMBER(30),
    댓글_답글     CHAR(1),
    댓글_비밀글    CHAR(1),
    댓글_작성자    VARCHAR2(15) NOT NULL,
    댓글_공개여부     CHAR(1) NOT NULL,
    댓글_작성자_공개여부 CHAR(1) NOT NULL
);
ALTER TABLE 댓글 ADD CONSTRAINT 댓글_pk PRIMARY KEY ( 댓글_글번호);

ALTER TABLE 댓글
    ADD CONSTRAINT 댓글_글번호_pf FOREIGN KEY ( 댓글_글번호 )
        REFERENCES 게시판 ( 글_번호 );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
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
