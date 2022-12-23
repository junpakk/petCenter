
-- 댓글
CREATE TABLE PC_REPLY (
    BRNUM VARCHAR2(20) PRIMARY KEY 
   ,MNUM VARCHAR2(20)
   ,MID VARCHAR2(20) NOT NULL
   ,BCNUM VARCHAR2(20) NOT NULL
   ,BRCONTENT VARCHAR2(200) NOT NULL
   ,DELYN VARCHAR2(1) NOT NULL
   ,IDATE DATE
   ,UDATE DATE
);


SELECT * FROM PC_REPLY;   

DROP TABLE PC_REPLY;

SELECT TABLE_NAME, COLUMN_NAME, INDEX_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN ('PC_REPLY');

SELECT  /*+ INDEX_DESC(A SYS_C0011185) */
        NVL(MAX(SUBSTR(A.BRNUM, -4)), 0) + 1  BRNUM 
FROM    PC_REPLY A;

-- 좋아요 반대

CREATE TABLE PC_LIKE (
    BLNUM VARCHAR2(20) PRIMARY KEY 
   ,MNUM VARCHAR2(20)
   ,BCNUM VARCHAR2(20) NOT NULL
   ,LIKEY VARCHAR2(200) 
   ,HATE VARCHAR2(200)
   ,DELYN VARCHAR2(1) NOT NULL
   ,IDATE DATE

);


SELECT * FROM PC_LIKE;   

DROP TABLE PC_LIKE;

SELECT TABLE_NAME, COLUMN_NAME, INDEX_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN ('PC_LIKE');

SELECT  /*+ INDEX_DESC(A SYS_C0011193) */
        NVL(MAX(SUBSTR(A.BLNUM, -4)), 0) + 1  BLNUM 
FROM    PC_LIKE A;

