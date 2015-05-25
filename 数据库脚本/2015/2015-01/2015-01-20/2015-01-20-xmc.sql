-- Create table
create table T_TJFX_DWDAYSJLTJBB
(
  BH          VARCHAR2(50),
  ORGCODE     VARCHAR2(12),
  ORGNAME     VARCHAR2(120),
  LEVE        NUMBER,
  PARENT_CODE VARCHAR2(12),
  TJRQ        VARCHAR2(8),
  TJSJ        DATE,
  TJQSRQ      VARCHAR2(14),
  TJJZRQ      VARCHAR2(14),
  ZS          NUMBER,
  CZRKS       NUMBER,
  LDRKS       NUMBER,
  JZRKS       NUMBER,
  WLHRKS      NUMBER,
  CYRYS       NUMBER,
  SYDWS       NUMBER
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_TJFX_DWDAYSJLTJBB
  is '单位每天数据统计量报表';
-- Add comments to the columns 
comment on column T_TJFX_DWDAYSJLTJBB.BH
  is '编号';
comment on column T_TJFX_DWDAYSJLTJBB.ORGCODE
  is '单位代码';
comment on column T_TJFX_DWDAYSJLTJBB.ORGNAME
  is '单位名称';
comment on column T_TJFX_DWDAYSJLTJBB.LEVE
  is '层级';
comment on column T_TJFX_DWDAYSJLTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_DWDAYSJLTJBB.TJRQ
  is '统计日期';
comment on column T_TJFX_DWDAYSJLTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_DWDAYSJLTJBB.TJQSRQ
  is '统计起始日期';
comment on column T_TJFX_DWDAYSJLTJBB.TJJZRQ
  is '统计截止日期';
comment on column T_TJFX_DWDAYSJLTJBB.ZS
  is '总是';
comment on column T_TJFX_DWDAYSJLTJBB.CZRKS
  is '常住人口数';
comment on column T_TJFX_DWDAYSJLTJBB.LDRKS
  is '流动人口数';
comment on column T_TJFX_DWDAYSJLTJBB.JZRKS
  is '寄住人口数';
comment on column T_TJFX_DWDAYSJLTJBB.WLHRKS
  is '未落户人口数';
comment on column T_TJFX_DWDAYSJLTJBB.CYRYS
  is '从业人员数';
comment on column T_TJFX_DWDAYSJLTJBB.SYDWS
  is '实有单位数';

-- Drop columns 
alter table T_TJFX_DWDAYSJLTJBB drop column BH;

-- Add/modify columns 
alter table T_TJFX_DWDAYSJLTJBB add STXXS number;
alter table T_TJFX_DWDAYSJLTJBB add FWXXS number;
-- Add comments to the columns 
comment on column T_TJFX_DWDAYSJLTJBB.STXXS
  is '实体信息数';
comment on column T_TJFX_DWDAYSJLTJBB.FWXXS
  is '房屋信息数';

-- Add/modify columns 
alter table T_TJFX_DWDAYSJLTJBB modify ZS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify CZRKS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify LDRKS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify JZRKS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify WLHRKS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify CYRYS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify SYDWS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify STXXS default 0;
alter table T_TJFX_DWDAYSJLTJBB modify FWXXS default 0;

 
 
CREATE OR REPLACE PACKAGE SQJW_TJBB
AS
       --出 租 房 屋 统 计 报 表
       PROCEDURE P_TJBB_DWDAYSJLTJBB(V_TJQSSJ  DATE,V_TJJZSJ  DATE);

END SQJW_TJBB;
/
CREATE OR REPLACE PACKAGE BODY SQJW_TJBB IS
        --机构每天登记数据量统计表
        PROCEDURE P_TJBB_DWDAYSJLTJBB(V_TJQSSJ DATE,V_TJJZSJ  DATE)
        IS
              CURSOR ORG_CUR_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE=5;

              CURSOR PUP_ORG_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE<5 ORDER BY ORGCODE;

              TYPE TYPE_ORG_CUR_LIST IS TABLE OF ORG_CUR_LIST%ROWTYPE;
              ORGLIST           TYPE_ORG_CUR_LIST;
              
              TYPE TYPE_PUP_ORG_LIST IS TABLE OF PUP_ORG_LIST%ROWTYPE;
              PUPORGLIST        TYPE_PUP_ORG_LIST;
              V_TJSJ            DATE;
              V_TJRQ            VARCHAR2(8);
              V_ZS              NUMBER;
              V_CZRKS           NUMBER;
              V_LDRKS           NUMBER;
              V_JZRKS           NUMBER;
              V_WLHRKS          NUMBER;
              V_CYRYS           NUMBER;
              V_SYDWS           NUMBER;
              V_STXXS           NUMBER;
              V_FWXXS           NUMBER;
              V_COUNT           NUMBER;
         BEGIN
            V_TJSJ := SYSDATE;
            V_TJRQ := TO_CHAR(V_TJQSSJ, 'YYYYMMDD');
            OPEN ORG_CUR_LIST;
            LOOP
                 FETCH ORG_CUR_LIST BULK COLLECT INTO ORGLIST LIMIT 1000;
                 EXIT WHEN ORGLIST.COUNT = 0 ;
                 FOR K IN ORGLIST.FIRST .. ORGLIST.LAST LOOP
                      --常住人口
                     SELECT COUNT(1) INTO V_CZRKS
                     FROM T_LSGL_RK_CZRK
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                           
                     --流动人口
                     SELECT COUNT(1) INTO V_LDRKS
                     FROM T_LSGL_RK_LDRKZZXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                       
                     --寄住人口
                     SELECT COUNT(1) INTO V_JZRKS
                     FROM T_LSGL_RK_JZRKXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                     
                     --未落户人口
                     SELECT COUNT(1) INTO V_WLHRKS
                     FROM T_LSGL_RK_WLHCZHK
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                     
                     --从业人员
                     SELECT COUNT(1) INTO V_CYRYS
                     FROM T_ZA_RY_CYRY
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                     
                     --实有单位
                     SELECT COUNT(1) INTO V_SYDWS
                     FROM T_ZA_JG_JBXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                       
                     SELECT COUNT(1) INTO V_STXXS
                     FROM T_COMMON_STXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                           
                           
                     SELECT COUNT(1) INTO V_FWXXS
                     FROM T_LSGL_FW_JBXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=TO_DATE(TO_CHAR(V_TJSJ-1,'YYYYMMDD'),'YYYYMMDD') 
                           AND DJSJ<TO_DATE(TO_CHAR(V_TJSJ,'YYYYMMDD'),'YYYYMMDD');
                     
                     V_ZS:=V_CZRKS + V_LDRKS + V_JZRKS + V_WLHRKS + V_CYRYS + V_SYDWS + V_STXXS + V_FWXXS;
                     
                     --是否存在数据
                     SELECT COUNT(1) INTO V_COUNT
                     FROM T_TJFX_DWDAYSJLTJBB 
                     WHERE ORGCODE=ORGLIST(K).ORGCODE 
                           AND TJRQ=V_TJRQ;
                     
                     IF V_COUNT=0 THEN
                         INSERT INTO T_TJFX_DWDAYSJLTJBB
                           (ORGCODE, ORGNAME, LEVE, PARENT_CODE, TJRQ, TJSJ, 
                            TJQSRQ, TJJZRQ, ZS, CZRKS, LDRKS, JZRKS, WLHRKS, 
                            CYRYS, SYDWS,STXXS,FWXXS)
                         VALUES
                           (ORGLIST(K).ORGCODE, ORGLIST(K).ORGNAME, ORGLIST(K).LEVE, ORGLIST(K).PARENT_CODE, 
                            V_TJRQ, V_TJSJ, TO_CHAR(V_TJQSSJ,'YYYYMMDD'), TO_CHAR(V_TJJZSJ,'YYYYMMDD'), 
                            V_ZS, V_CZRKS, V_LDRKS, V_JZRKS, V_WLHRKS, V_CYRYS, V_SYDWS,V_STXXS,V_FWXXS);
                     ELSE
                          UPDATE T_TJFX_DWDAYSJLTJBB
                             SET 
                                 ORGNAME = ORGLIST(K).ORGNAME,
                                 LEVE = ORGLIST(K).LEVE,
                                 PARENT_CODE = ORGLIST(K).PARENT_CODE,
                                 TJSJ = V_TJSJ,
                                 TJQSRQ = TO_CHAR(V_TJQSSJ,'YYYYMMDD'),
                                 TJJZRQ = TO_CHAR(V_TJJZSJ,'YYYYMMDD'),
                                 ZS = V_ZS,
                                 CZRKS = V_CZRKS,
                                 LDRKS = V_LDRKS,
                                 JZRKS = V_JZRKS,
                                 WLHRKS = V_WLHRKS,
                                 CYRYS = V_CYRYS,
                                 SYDWS = V_SYDWS,
                                 STXXS = V_STXXS,
                                 FWXXS = V_FWXXS
                           WHERE ORGCODE = ORGLIST(K).ORGCODE AND TJRQ = V_TJRQ;
                             
                     END IF;
                       
                 END LOOP;
                 COMMIT;
            END LOOP;
            --汇总上级单位
            OPEN PUP_ORG_LIST;
            LOOP
                 FETCH PUP_ORG_LIST BULK COLLECT INTO PUPORGLIST LIMIT 1000;
                 EXIT WHEN PUPORGLIST.COUNT=0;
                 FOR I IN PUPORGLIST.FIRST .. PUPORGLIST.LAST LOOP
                    SELECT NVL(SUM(ZS),0), NVL(SUM(CZRKS),0), NVL(SUM(LDRKS),0), NVL(SUM(JZRKS),0),NVL(SUM(WLHRKS),0), 
                           NVL(SUM(CYRYS),0), NVL(SUM(SYDWS),0), NVL(SUM(STXXS),0),NVL(SUM(FWXXS),0) 
                           INTO V_ZS, V_CZRKS, V_LDRKS,V_JZRKS,V_WLHRKS,V_CYRYS,V_SYDWS,V_STXXS,V_FWXXS
                    FROM T_TJFX_DWDAYSJLTJBB 
                    WHERE TJRQ=V_TJRQ 
                          AND LEVE=5 
                          AND ORGCODE LIKE SUBSTR(PUPORGLIST(I).ORGCODE,1,2*PUPORGLIST(I).LEVE)||'%';  
                      
                    --是否存在数据
                     SELECT COUNT(1) INTO V_COUNT
                     FROM T_TJFX_DWDAYSJLTJBB 
                     WHERE ORGCODE=PUPORGLIST(I).ORGCODE 
                           AND TJRQ=V_TJRQ;
                     
                     IF V_COUNT=0 THEN
                         INSERT INTO T_TJFX_DWDAYSJLTJBB
                           (ORGCODE, ORGNAME, LEVE, PARENT_CODE, TJRQ, TJSJ, 
                            TJQSRQ, TJJZRQ, ZS, CZRKS, LDRKS, JZRKS, WLHRKS, 
                            CYRYS, SYDWS,STXXS,FWXXS)
                         VALUES
                           (PUPORGLIST(I).ORGCODE, PUPORGLIST(I).ORGNAME, PUPORGLIST(I).LEVE, PUPORGLIST(I).PARENT_CODE, 
                            V_TJRQ, V_TJSJ, TO_CHAR(V_TJQSSJ,'YYYYMMDD'), TO_CHAR(V_TJJZSJ,'YYYYMMDD'), V_ZS, V_CZRKS, 
                            V_LDRKS, V_JZRKS, V_WLHRKS, V_CYRYS, V_SYDWS,V_STXXS,V_FWXXS);
                     ELSE
                          UPDATE T_TJFX_DWDAYSJLTJBB
                             SET 
                                 ORGNAME = PUPORGLIST(I).ORGNAME,
                                 LEVE = PUPORGLIST(I).LEVE,
                                 PARENT_CODE = PUPORGLIST(I).PARENT_CODE,
                                 TJSJ = V_TJSJ,
                                 TJQSRQ = TO_CHAR(V_TJQSSJ,'YYYYMMDD'),
                                 TJJZRQ = TO_CHAR(V_TJJZSJ,'YYYYMMDD'),
                                 ZS = V_ZS,
                                 CZRKS = V_CZRKS,
                                 LDRKS = V_LDRKS,
                                 JZRKS = V_JZRKS,
                                 WLHRKS = V_WLHRKS,
                                 CYRYS = V_CYRYS,
                                 SYDWS = V_SYDWS,
                                 STXXS = V_STXXS,
                                 FWXXS = V_FWXXS
                           WHERE ORGCODE = PUPORGLIST(I).ORGCODE AND TJRQ = V_TJRQ;  
                     END IF;
                 END LOOP;
                 COMMIT;
            END LOOP;
          
            
         END P_TJBB_DWDAYSJLTJBB;
END SQJW_TJBB;
/

CREATE OR REPLACE PROCEDURE P_EXEC_TJBB_DWDAYSJLTJBB(V_TYPE VARCHAR2)
AS
       V_CURRENTDATE  DATE;
BEGIN
       --初始化
       IF V_TYPE = '1' THEN
           V_CURRENTDATE:=TO_DATE('20141231','YYYYMMDD');
           LOOP
                 V_CURRENTDATE := V_CURRENTDATE + 1;
                 EXIT WHEN V_CURRENTDATE>=trunc(SYSDATE);
                 SQJW_TJBB.P_TJBB_DWDAYSJLTJBB(V_CURRENTDATE,V_CURRENTDATE + 1);
           END LOOP;
       --每天计算
       ELSIF V_TYPE = '2' THEN
           V_CURRENTDATE:=SYSDATE;
           FOR I IN 1..7 LOOP
               V_CURRENTDATE:=TRUNC(V_CURRENTDATE-1);
               SQJW_TJBB.P_TJBB_DWDAYSJLTJBB(V_CURRENTDATE,V_CURRENTDATE + 1);
           END LOOP;
       END IF;

END;
/