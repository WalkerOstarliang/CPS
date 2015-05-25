-- Create table
create table T_COMMON_XZQH_BGJL
(
  ID        VARCHAR2(27) not null,
  QYSQDM    VARCHAR2(12) not null,
  FROMJWQDM VARCHAR2(12),
  TOJWQDM   VARCHAR2(12) not null,
  CZDWDM    VARCHAR2(12),
  CZDWMC    VARCHAR2(120),
  CZRSFZH   VARCHAR2(18),
  CZRXM     VARCHAR2(30),
  CZRJH     VARCHAR2(50),
  CZSJ      DATE,
  ISEXEC    VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_COMMON_XZQH_BGJL
  is '行政区划变更记录执行任务表';
-- Add comments to the columns 
comment on column T_COMMON_XZQH_BGJL.ID
  is 'ID';
comment on column T_COMMON_XZQH_BGJL.QYSQDM
  is '迁移社区代码';
comment on column T_COMMON_XZQH_BGJL.FROMJWQDM
  is '迁移前警务区代码';
comment on column T_COMMON_XZQH_BGJL.TOJWQDM
  is '迁移后警务区代码';
comment on column T_COMMON_XZQH_BGJL.CZDWDM
  is '操作单位代码';
comment on column T_COMMON_XZQH_BGJL.CZDWMC
  is '操作单位名称';
comment on column T_COMMON_XZQH_BGJL.CZRSFZH
  is '操作人身份证号';
comment on column T_COMMON_XZQH_BGJL.CZRXM
  is '操作人姓名';
comment on column T_COMMON_XZQH_BGJL.CZRJH
  is '操作人警号';
comment on column T_COMMON_XZQH_BGJL.CZSJ
  is '操作时间';
comment on column T_COMMON_XZQH_BGJL.ISEXEC
  is '是否执行 0：未执行 1：已执行';


CREATE OR REPLACE PROCEDURE P_EXEC_CHANGEXZQHFORDATA
--社区变更，实体变更执行操作
AS
      CURSOR CUR_LIST IS
          SELECT ID, QYSQDM, FROMJWQDM, TOJWQDM, CZDWDM, CZDWMC, CZRSFZH, CZRXM, CZRJH, CZSJ, ISEXEC 
          FROM T_COMMON_XZQH_BGJL
          WHERE ISEXEC='0'
          ORDER BY CZSJ ASC;
       
      CURSOR CUR_LIST_ST IS 
          SELECT ID, QYSTID, FROMSQDM, FROMJWQDM, TOSQDM, TOJWQDM, CZDWDM, CZDWMC, CZSJ, CZRSFZH, CZRJH, CZRXM, ISEXEC 
          FROM T_COMMON_STXX_BGJL
          WHERE ISEXEC='0'
          ORDER BY CZSJ ASC;
          
   
      TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
      TYPE STLISTTYPE IS TABLE OF CUR_LIST_ST%ROWTYPE;
      
      LIST       LISTTYPE;
      STLIST     STLISTTYPE;
      V_ERROR    VARCHAR2(120);
BEGIN
      --社区变更执行
      OPEN CUR_LIST;
      LOOP
           FETCH CUR_LIST BULK COLLECT INTO LIST LIMIT 100;
           EXIT WHEN LIST.COUNT=0;
           FOR I IN LIST.FIRST .. LIST.LAST LOOP
               BEGIN
                    P_UPDATE_DATA_TO_GAJG(LIST(I).QYSQDM);
                    
                    UPDATE T_COMMON_XZQH_BGJL
                    SET ISEXEC='1'
                    WHERE ID=LIST(I).ID;
                    COMMIT;
                    
                    EXCEPTION WHEN OTHERS THEN
                       V_ERROR:=SQLERRM;
                       INSERT INTO T_LOG(ID,MSG,TYPE)
                       VALUES (SEQ_COMMON_LOG.NEXTVAL,'执行社区变更任务错误',V_ERROR);
                       COMMIT;
               END;
           END LOOP;
      END LOOP;
      
      --实体变更执行
      OPEN CUR_LIST_ST;
      LOOP
           FETCH CUR_LIST_ST BULK COLLECT INTO STLIST LIMIT 100;
           EXIT WHEN STLIST.COUNT=0;
           FOR I IN STLIST.FIRST .. STLIST.LAST LOOP
               BEGIN
                   
                   P_UPDATE_DATA_TO_GAJG_BYSTID(STLIST(I).QYSTID,STLIST(I).TOSQDM);
                   
                   UPDATE T_COMMON_STXX_BGJL
                   SET ISEXEC='1'
                   WHERE ID=STLIST(I).ID;
                   COMMIT;
                   
                   EXCEPTION WHEN OTHERS THEN
                       V_ERROR:=SQLERRM;
                       INSERT INTO T_LOG(ID,MSG,TYPE)
                       VALUES (SEQ_COMMON_LOG.NEXTVAL,'执行社区变更任务错误',V_ERROR);
                       COMMIT;
               END;
           END LOOP;
      END LOOP;
      
END P_EXEC_CHANGEXZQHFORDATA;
/