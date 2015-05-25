-- Create table
create table T_COMMON_XTTX_SJBF
(
  ORGCODE  VARCHAR2(12),
  ORGNAME  VARCHAR2(120),
  TJRQ     VARCHAR2(8),
  LDRKDQTX NUMBER,
  CYRYHSTX NUMBER,
  CZFWDJTX NUMBER,
  ZDRYTGTX NUMBER,
  CZFWXCTX NUMBER,
  ZDRYZKDJ NUMBER,
  STXXBZTX NUMBER,
  CYRYPFTX NUMBER
);
-- Add comments to the table 
comment on table T_COMMON_XTTX_SJBF
  is '系统提醒数据量备份';
-- Add comments to the columns 
comment on column T_COMMON_XTTX_SJBF.ORGCODE
  is '机构代码';
comment on column T_COMMON_XTTX_SJBF.ORGNAME
  is '机构名称';
comment on column T_COMMON_XTTX_SJBF.TJRQ
  is '统计日期';
comment on column T_COMMON_XTTX_SJBF.LDRKDQTX
  is '流动人口延期';
comment on column T_COMMON_XTTX_SJBF.CYRYHSTX
  is '从业人员核实';
comment on column T_COMMON_XTTX_SJBF.CZFWDJTX
  is '出租房屋登记';
comment on column T_COMMON_XTTX_SJBF.ZDRYTGTX
  is '重点人员托管';
comment on column T_COMMON_XTTX_SJBF.CZFWXCTX
  is '出租房屋巡查';
comment on column T_COMMON_XTTX_SJBF.ZDRYZKDJ
  is '重点人员在控登记';
comment on column T_COMMON_XTTX_SJBF.STXXBZTX
  is '实体信息标注';
comment on column T_COMMON_XTTX_SJBF.CYRYPFTX
  is '从业人员派发';

  
CREATE OR REPLACE PROCEDURE P_EXEC_XTTXSJBF
AS
       CURSOR CUR_LIST IS
              SELECT ORGCODE,ORGNAME
              FROM T_COMMON_ORGANIZATION_SJJS 
              WHERE LEVE=5;
       TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
       LIST    LISTTYPE;
       V_SQL         VARCHAR2(4000);
       V_TJRQ        VARCHAR2(8);
       V_ERROR       VARCHAR2(300);
       V_LDRKDQTX    NUMBER;
       V_CYRYHSTX    NUMBER;
       V_CZFWDJTX    NUMBER;
       V_ZDRYTGTX    NUMBER;
       V_CZFWXCTX    NUMBER;
       V_ZDRYZKDJ    NUMBER;
       V_STXXBZTX    NUMBER;
       V_CYRYPFTX    NUMBER;
BEGIN
       V_TJRQ:=TO_CHAR(SYSDATE,'YYYYMMDD');
       OPEN CUR_LIST;
       LOOP
            FETCH CUR_LIST BULK COLLECT INTO LIST LIMIT 100;
            EXIT WHEN LIST.COUNT=0;
            FOR I IN LIST.FIRST..LIST.LAST LOOP
                BEGIN
                    --流动人口延期
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE LOWER(PZDM)=LOWER('LDRKDQTX');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_LDRKDQTX;
                    
                    --从业人员核实
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE LOWER(PZDM)=LOWER('CYRYTX');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_CYRYHSTX;
                    
                    --出租房屋登记
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE LOWER(PZDM)=LOWER('CZFWXXDJTX');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_CZFWDJTX;
                    
                    --重点人员托管
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE LOWER(PZDM)=LOWER('ZDRYZKTG');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_ZDRYTGTX;
                    
                    --出租房巡查
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE UPPER(PZDM)=UPPER('FWJCPZDMALL');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_CZFWXCTX;
                    
                    --重点人员在控
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE UPPER(PZDM)=UPPER('ZDRYZKDJ');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_ZDRYZKDJ;
                    
                    --实体标注
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE UPPER(PZDM)=UPPER('STXXBZTX');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_STXXBZTX;
                    
                    --从业人员派发
                    SELECT 'SELECT COUNT(1) FROM ('||REPLACE(SQL,LOWER('#[ORGCODE]'),''''||LIST(I).ORGCODE||'''')||')' INTO V_SQL
                    FROM T_COMMON_XTTX_PZ 
                    WHERE UPPER(PZDM)=UPPER('CYRYPFTX');    
                    
                    EXECUTE IMMEDIATE V_SQL INTO V_CYRYPFTX;
                    
                    INSERT INTO T_COMMON_XTTX_SJBF
                    (ORGCODE, ORGNAME, TJRQ, LDRKDQTX, CYRYHSTX, CZFWDJTX, ZDRYTGTX, CZFWXCTX, ZDRYZKDJ, STXXBZTX, CYRYPFTX)
                   VALUES
                    (LIST(I).ORGCODE, LIST(I).ORGNAME, V_TJRQ, V_LDRKDQTX, V_CYRYHSTX, V_CZFWDJTX, V_ZDRYTGTX, V_CZFWXCTX, V_ZDRYZKDJ, V_STXXBZTX, V_CYRYPFTX);
                   COMMIT;
                 EXCEPTION WHEN OTHERS THEN
                              V_ERROR:=SQLERRM;
               
               END;
            END LOOP;
            
       END LOOP;
END;
/