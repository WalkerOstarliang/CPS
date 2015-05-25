
-- Add/modify columns 
alter table T_COMMON_XQTJQK add CYRYS number default 0;
-- Add comments to the columns 
comment on column T_COMMON_XQTJQK.CYRYS
  is '从业人员数';
  
  -- Add/modify columns 
alter table T_COMMON_XQTJQK add QBXXS number default 0;
-- Add comments to the columns 
comment on column T_COMMON_XQTJQK.QBXXS
  is '情报信息采集数';
  
  -- Add/modify columns 
alter table T_COMMON_XQTJQK add ZAPCS number default 0;
-- Add comments to the columns 
comment on column T_COMMON_XQTJQK.ZAPCS
  is '路面盘查数';


CREATE OR REPLACE FUNCTION F_GET_CYRYSNUMBER(V_CODE VARCHAR2,V_LV NUMBER)
-- V_CODE : 机构代码   V_LV:1、省厅用户 2、市级用户 3、区县级用户 4、派出所级用户 5、民警用户
--从业人员数统计
RETURN NUMBER
AS
 V_CYRY NUMBER;
 BEGIN
  V_CYRY :=0;
 IF V_LV=1 THEN
    SELECT COUNT(CYRY.CYRYBH) INTO V_CYRY FROM T_ZA_RY_CYRY CYRY
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = CYRY.RYBH)
    AND (CYRY.ZXBS = '0' OR CYRY.ZXBS IS NULL);

 ELSIF V_LV = 2 THEN
    SELECT COUNT(CYRY.CYRYBH) INTO V_CYRY FROM T_ZA_RY_CYRY CYRY
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = CYRY.RYBH)
    AND (CYRY.ZXBS = '0' OR CYRY.ZXBS IS NULL)
    AND CYRY.DJDWDM LIKE SUBSTR(V_CODE,1,4)||'%';

 ELSIF V_LV = 3 THEN
    SELECT COUNT(CYRY.CYRYBH) INTO V_CYRY FROM T_ZA_RY_CYRY CYRY
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = CYRY.RYBH)
    AND (CYRY.ZXBS = '0' OR CYRY.ZXBS IS NULL)
    AND CYRY.DJDWDM LIKE SUBSTR(V_CODE,1,6)||'%';

 ELSIF V_LV = 4 THEN
    SELECT COUNT(CYRY.CYRYBH) INTO V_CYRY FROM T_ZA_RY_CYRY CYRY
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = CYRY.RYBH)
    AND (CYRY.ZXBS = '0' OR CYRY.ZXBS IS NULL)
    AND CYRY.DJDWDM LIKE SUBSTR(V_CODE,1,8)||'%';

 ELSIF V_LV = 5  THEN
    SELECT COUNT(CYRY.CYRYBH) INTO V_CYRY FROM T_ZA_RY_CYRY CYRY
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = CYRY.RYBH)
    AND (CYRY.ZXBS = '0' OR CYRY.ZXBS IS NULL)
    AND CYRY.DJDWDM = V_CODE;
 END IF;
 RETURN V_CYRY;
END;
/


create or replace function f_get_cyryscount(v_orgcode varchar2) return number
--获取从业人员数量
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_CYRYSNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/




CREATE OR REPLACE FUNCTION F_GET_QBXXSNUMBER(V_CODE VARCHAR2,V_LV NUMBER)
-- V_CODE : 机构代码   V_LV:1、省厅用户 2、市级用户 3、区县级用户 4、派出所级用户 5、民警用户
--情报线索数统计
RETURN NUMBER
AS
 V_QBXX NUMBER;
 BEGIN
  V_QBXX :=0;
 IF V_LV=1 THEN
    SELECT COUNT(QBXX.LDXXBH) INTO V_QBXX FROM t_zyqb_sjxx QBXX;

 ELSIF V_LV = 2 THEN
    SELECT COUNT(QBXX.LDXXBH) INTO V_QBXX FROM t_zyqb_sjxx QBXX
    WHERE QBXX.TBDWJGDM LIKE SUBSTR(V_CODE,1,4)||'%';

 ELSIF V_LV = 3 THEN
    SELECT COUNT(QBXX.LDXXBH) INTO V_QBXX FROM t_zyqb_sjxx QBXX
    WHERE  QBXX.TBDWJGDM LIKE SUBSTR(V_CODE,1,6)||'%';

 ELSIF V_LV = 4 THEN
    SELECT COUNT(QBXX.LDXXBH) INTO V_QBXX FROM t_zyqb_sjxx QBXX
    WHERE  QBXX.TBDWJGDM LIKE SUBSTR(V_CODE,1,8)||'%';

 ELSIF V_LV = 5  THEN
    SELECT COUNT(QBXX.LDXXBH) INTO V_QBXX FROM t_zyqb_sjxx QBXX
    WHERE  QBXX.TBDWJGDM  = V_CODE;
 END IF;
 RETURN V_QBXX;
 END;
/
 

create or replace function f_get_qbxxscount(v_orgcode varchar2) return number
--获取情报信息数量
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_QBXXSNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/

CREATE OR REPLACE FUNCTION F_GET_ZAPCSNUMBER(V_CODE VARCHAR2,V_LV NUMBER)
-- V_CODE : 机构代码   V_LV:1、省厅用户 2、市级用户 3、区县级用户 4、派出所级用户 5、民警用户
--治安盘查数统计
RETURN NUMBER
AS
 V_ZAPC NUMBER;
 BEGIN
  V_ZAPC :=0;
 IF V_LV=1 THEN
    SELECT COUNT(ZAPC.JLBH) INTO V_ZAPC FROM t_af_lmpcxx ZAPC;

 ELSIF V_LV = 2 THEN
    SELECT COUNT(ZAPC.JLBH) INTO V_ZAPC FROM t_af_lmpcxx ZAPC
    WHERE ZAPC.djrdwdm LIKE SUBSTR(V_CODE,1,4)||'%';

 ELSIF V_LV = 3 THEN
    SELECT COUNT(ZAPC.JLBH) INTO V_ZAPC FROM t_af_lmpcxx ZAPC
    WHERE  ZAPC.djrdwdm LIKE SUBSTR(V_CODE,1,6)||'%';

 ELSIF V_LV = 4 THEN
    SELECT COUNT(ZAPC.JLBH) INTO V_ZAPC FROM t_af_lmpcxx ZAPC
    WHERE  ZAPC.djrdwdm LIKE SUBSTR(V_CODE,1,8)||'%';

 ELSIF V_LV = 5  THEN
    SELECT COUNT(ZAPC.JLBH) INTO V_ZAPC FROM t_af_lmpcxx ZAPC
    WHERE  ZAPC.djrdwdm  = V_CODE;
 END IF;
 RETURN V_ZAPC;
 END;
 /


create or replace function f_get_zapcscount(v_orgcode varchar2) return number
--获取治安盘查数量
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_ZAPCSNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/




CREATE OR REPLACE PROCEDURE P_EXEC_XZQHXQTJ AS
  CURSOR CUR_LIST IS
     SELECT ORGCODE DM, ORGNAME MC, PARENT_CODE PARENT_DM, ORGJC JC
      FROM T_COMMON_ORGANIZATION_SJJS
      WHERE LEVE <= 3
       AND ORGCODE LIKE '4301%';

  TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST LISTTYPE;

  V_ORGCODE      VARCHAR2(12);
  V_PARENTCODE   VARCHAR2(12);
  V_ORGNAME      VARCHAR2(120);
  V_LEVE         NUMBER;
  V_CZRKS        NUMBER;
  V_LDRKS        NUMBER;
  V_FWS          NUMBER;
  V_CZFWS        NUMBER;
  V_ZDDXS        NUMBER;
  V_XDRYS        NUMBER;
  V_JSBRS        NUMBER;
  V_TZHYS        NUMBER;
  V_GGCSS        NUMBER;
  V_NBDWS        NUMBER;
  V_WXPDWS       NUMBER;
  V_SWCSS        NUMBER;
  V_SWDWS        NUMBER;
  V_KSYDW        NUMBER;
  V_JFDW         NUMBER;
  V_QTDW         NUMBER;
  V_LGDW         NUMBER;
  V_JWRKS        NUMBER;
  V_JZRKS        NUMBER;
  V_RECORD       NUMBER;
  V_ERROR        VARCHAR2(1000);
  V_STS          NUMBER;
  V_QLSDRYS      NUMBER;
  V_QLSWRYS      NUMBER;
  V_QLZTRYS      NUMBER;
  V_QLXSFZRYS    NUMBER;
  V_QLZSZHJSBRYS NUMBER;
  V_QLSFRYS      NUMBER;
  V_QLSKRYS      NUMBER;
  V_QLGZDXRYS    NUMBER;
  V_WLHRK        NUMBER;
  V_DWZS         NUMBER;
  --从业人员数，情报线索数，路面盘查数
  V_CYRYS        NUMBER;
  V_QBXXS        NUMBER;
  V_ZAPCS        NUMBER;
BEGIN
  --打开县区以上单位统计游标
  OPEN CUR_LIST;
  LOOP
    --先拿出游标中的 1000 条数据
    FETCH CUR_LIST BULK COLLECT
      INTO LIST LIMIT 100;
    EXIT WHEN LIST.COUNT = 0;
    --循环 当前的1000条数据
    FOR I IN LIST.FIRST .. LIST.LAST LOOP
      BEGIN
        SELECT T.ORGCODE,
               T.PARENT_CODE,
               T.ORGJC,
               T.LEVE,
               F_GET_CZRKCOUNT(T.ORGCODE),
               F_GET_LDRKCOUNT(T.ORGCODE),
               F_GET_FWCOUNT(T.ORGCODE),
               F_GET_CZFWCOUNT(T.ORGCODE),
               F_GET_ZDRYCOUNT(T.ORGCODE),
               0 AS XDRYS,
               0 AS JSBRS,
               F_GET_DWBYHYLB(T.ORGCODE, '01'),
               F_GET_DWBYHYLB(T.ORGCODE, '02'),
               F_GET_DWBYHYLB(T.ORGCODE, '03'),
               F_GET_DWBYHYLB(T.ORGCODE, '04'),
               F_GET_DWBYHYLB(T.ORGCODE, '05'),
               F_GET_DWBYHYLB(T.ORGCODE, '06'),
               F_GET_JWRKCOUNT(T.ORGCODE),
               F_GET_JZRKCOUNT(T.ORGCODE),
               F_GET_STCOUNT(T.ORGCODE),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '01'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '02'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '03'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '04'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '05'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '06'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '07'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '02', '00'),
               F_GET_DWBYHYLB(T.ORGCODE, '07'),
               F_GET_DWBYHYLB(T.ORGCODE, '08'),
               F_GET_DWBYHYLB(T.ORGCODE, '09'),
               F_GET_DWBYHYLB(T.ORGCODE, '10'),
               F_GET_DWBYHYLB(T.ORGCODE, null),
               F_GET_WLHRKCOUNT(T.ORGCODE),
               f_get_cyryscount(T.orgcode),
               f_get_qbxxscount(T.orgcode),
               f_get_zapcscount(T.orgcode)
          INTO V_ORGCODE,
               V_PARENTCODE,
               V_ORGNAME,
               V_LEVE,
               V_CZRKS,
               V_LDRKS,
               V_FWS,
               V_CZFWS,
               V_ZDDXS,
               V_XDRYS,
               V_JSBRS,
               V_TZHYS,
               V_GGCSS,
               V_NBDWS,
               V_WXPDWS,
               V_SWCSS,
               V_SWDWS,
               V_JWRKS,
               V_JZRKS,
               V_STS,
               V_QLSKRYS,
               V_QLSWRYS,
               V_QLZTRYS,
               V_QLSDRYS,
               V_QLXSFZRYS,
               V_QLZSZHJSBRYS,
               V_QLSFRYS,
               V_QLGZDXRYS,
               V_LGDW,
               V_KSYDW,
               V_JFDW,
               V_QTDW,
               V_DWZS,
               V_WLHRK,
               V_CYRYS,
               V_QBXXS,
               V_ZAPCS
          FROM V_COMMON_ORGANIZATION T
         WHERE ORGCODE = LIST(I).DM;

        SELECT COUNT(1)
          INTO V_RECORD
          FROM T_COMMON_XQTJQK
         WHERE ORGCODE = V_ORGCODE;
        IF V_RECORD <= 0 THEN
          INSERT INTO T_COMMON_XQTJQK
            (ORGCODE,
             ORGNAME,
             PARENT_CODE,
             LEVE,
             CZRKS,
             LDRKS,
             FWS,
             CZFWS,
             ZDDXS,
             XDRYS,
             JSBRS,
             TZHYS,
             GGCSS,
             NBDWS,
             WXPDWS,
             SWCSS,
             SWDWS,
             JWRKS,
             JZRKS,
             STS,
             QLSDRYS,
             QLSWRYS,
             QLZTRYS,
             QLXSFZRYS,
             QLZSZHJSBRYS,
             QLSFRYS,
             QLSKRYS,
             QLGZDXRYS,
             LGCS,
             KSYDW,
             JFDW,
             QTDW,
             DWZS,
             WLHRKS,
             CYRYS,
             QBXXS,
             ZAPCS)
          VALUES
            (V_ORGCODE,
              LIST(I).MC ,   --改 V_ORGNAME 为MCV_ORGNAME,
             V_PARENTCODE,
             V_LEVE,
             V_CZRKS,
             V_LDRKS,
             V_FWS,
             V_CZFWS,
             V_ZDDXS,
             V_QLSDRYS,
             V_QLZSZHJSBRYS,
             V_TZHYS,
             V_GGCSS,
             V_NBDWS,
             V_WXPDWS,
             V_SWCSS,
             V_SWDWS,
             V_JWRKS,
             V_JZRKS,
             V_STS,
             V_QLSDRYS,
             V_QLSWRYS,
             V_QLZTRYS,
             V_QLXSFZRYS,
             V_QLZSZHJSBRYS,
             V_QLSFRYS,
             V_QLSKRYS,
             V_QLGZDXRYS,
             V_LGDW,
             V_KSYDW,
             V_JFDW,
             V_QTDW,
             V_DWZS,
             V_WLHRK,
             V_CYRYS,
             V_QBXXS,
             V_ZAPCS);
        ELSE
          UPDATE T_COMMON_XQTJQK
             SET CZRKS        = V_CZRKS,
                 LDRKS        = V_LDRKS,
                 JWRKS        = V_JWRKS,
                 JZRKS        = V_JZRKS,
                 FWS          = V_FWS,
                 CZFWS        = V_CZFWS,
                 ZDDXS        = V_ZDDXS,
                 XDRYS        = V_QLSDRYS,
                 JSBRS        = V_QLZSZHJSBRYS,
                 TZHYS        = V_TZHYS,
                 GGCSS        = V_GGCSS,
                 NBDWS        = V_NBDWS,
                 WXPDWS       = V_WXPDWS,
                 SWCSS        = V_SWCSS,
                 SWDWS        = V_SWDWS,
                 GXSJ         = SYSDATE,
                 STS          = V_STS,
                 QLSDRYS      = V_QLSDRYS,
                 QLSWRYS      = V_QLSWRYS,
                 QLZTRYS      = V_QLZTRYS,
                 QLXSFZRYS    = V_QLXSFZRYS,
                 QLZSZHJSBRYS = V_QLZSZHJSBRYS,
                 QLSFRYS      = V_QLSFRYS,
                 QLSKRYS      = V_QLSKRYS,
                 QLGZDXRYS    = V_QLGZDXRYS,
                 LGCS         = V_LGDW,
                 KSYDW        = V_KSYDW,
                 JFDW         = V_JFDW,
                 QTDW         = V_QTDW,
                 DWZS         = V_DWZS,
                 WLHRKS       = V_WLHRK,
                 ORGNAME      = LIST(I).MC,    --改 V_ORGNAME 为MC
                 CYRYS        = V_CYRYS,
                 QBXXS        = V_QBXXS,
                 ZAPCS        = V_ZAPCS
           WHERE ORGCODE = LIST(I).DM;
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
          V_ERROR := SQLERRM;
      END;
      COMMIT;
    END LOOP;
  END LOOP;
END P_EXEC_XZQHXQTJ;
/



CREATE OR REPLACE PROCEDURE P_EXEC_ORGCODEXQTJ AS

  CURSOR CUR_LIST IS
    SELECT ORGCODE, PARENT_CODE, ORGJC
      FROM V_COMMON_ORGANIZATION
     WHERE ((LEVE = '4' AND ISPCS = '1') OR LEVE = '5')
       AND PARENT_CODE IS NOT NULL
       AND ISYX = '1'
       and orgcode like '4301%'
    union
    select ORGCODE, PARENT_CODE, ORGJC
      from V_COMMON_ORGANIZATION
     where orgcode = '430199000000';

  TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST           LISTTYPE;
  V_ORGCODE      VARCHAR2(12);
  V_PARENTCODE   VARCHAR2(12);
  V_ORGNAME      VARCHAR2(120);
  V_LEVE         NUMBER;
  V_CZRKS        NUMBER;
  V_LDRKS        NUMBER;
  V_FWS          NUMBER;
  V_CZFWS        NUMBER;
  V_ZDDXS        NUMBER;
  V_XDRYS        NUMBER;
  V_JSBRS        NUMBER;
  V_TZHYS        NUMBER;
  V_GGCSS        NUMBER;
  V_NBDWS        NUMBER;
  V_WXPDWS       NUMBER;
  V_SWCSS        NUMBER;
  V_SWDWS        NUMBER;
  V_JWRKS        NUMBER;
  V_JZRKS        NUMBER;
  V_RECORD       NUMBER;
  V_ERROR        VARCHAR2(1000);
  V_STS          NUMBER;
  V_QLSDRYS      NUMBER;
  V_QLSWRYS      NUMBER;
  V_QLZTRYS      NUMBER;
  V_QLXSFZRYS    NUMBER;
  V_QLZSZHJSBRYS NUMBER;
  V_QLSFRYS      NUMBER;
  V_QLSKRYS      NUMBER;
  V_QLGZDXRYS    NUMBER;
  V_KSYDW        NUMBER;
  V_JFDW         NUMBER;
  V_QTDW         NUMBER;
  V_DWZS         NUMBER;
  V_LGDW         NUMBER;
  V_WLHRK        NUMBER;
  --从业人员数，情报线索数，路面盘查数
  V_CYRYS        NUMBER;
  V_QBXXS        NUMBER;
  V_ZAPCS        NUMBER;
BEGIN
  OPEN CUR_LIST;
  LOOP
    --先拿出游标中的 1000 条数据
    FETCH CUR_LIST BULK COLLECT
      INTO LIST LIMIT 100;
    EXIT WHEN LIST.COUNT = 0;
    --循环 当前的1000条数据
    FOR I IN LIST.FIRST .. LIST.LAST LOOP
      BEGIN
        SELECT T.ORGCODE,
               T.PARENT_CODE,
               T.ORGJC,
               T.LEVE,
               F_GET_CZRKCOUNT(T.ORGCODE),
               F_GET_LDRKCOUNT(T.ORGCODE),
               F_GET_FWCOUNT(T.ORGCODE),
               F_GET_CZFWCOUNT(T.ORGCODE),
               F_GET_ZDRYCOUNT(T.ORGCODE),
               0, --F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '04'),
               0, --F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '06'),
               F_GET_DWBYHYLB(T.ORGCODE, '01'),
               F_GET_DWBYHYLB(T.ORGCODE, '02'),
               F_GET_DWBYHYLB(T.ORGCODE, '03'),
               F_GET_DWBYHYLB(T.ORGCODE, '04'),
               F_GET_DWBYHYLB(T.ORGCODE, '05'),
               F_GET_DWBYHYLB(T.ORGCODE, '06'),
               F_GET_JWRKCOUNT(T.ORGCODE),
               F_GET_JZRKCOUNT(T.ORGCODE),
               F_GET_STCOUNT(T.ORGCODE),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '01'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '02'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '03'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '04'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '05'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '06'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '01', '07'),
               F_GET_ZDRYGZDXCOUNT(T.ORGCODE, '02', '00'),
               F_GET_DWBYHYLB(T.ORGCODE, '07'),
               F_GET_DWBYHYLB(T.ORGCODE, '08'),
               F_GET_DWBYHYLB(T.ORGCODE, '09'),
               F_GET_DWBYHYLB(T.ORGCODE, '10'),
               F_GET_DWBYHYLB(T.ORGCODE, null),
               F_GET_WLHRKCOUNT(T.ORGCODE),
               f_get_cyryscount(T.orgcode),
               f_get_qbxxscount(T.orgcode),
               f_get_zapcscount(T.orgcode)
          INTO V_ORGCODE,
               V_PARENTCODE,
               V_ORGNAME,
               V_LEVE,
               V_CZRKS,
               V_LDRKS,
               V_FWS,
               V_CZFWS,
               V_ZDDXS,
               V_XDRYS,
               V_JSBRS,
               V_TZHYS,
               V_GGCSS,
               V_NBDWS,
               V_WXPDWS,
               V_SWCSS,
               V_SWDWS,
               V_JWRKS,
               V_JZRKS,
               V_STS,
               V_QLSKRYS,
               V_QLSWRYS,
               V_QLZTRYS,
               V_QLSDRYS,
               V_QLXSFZRYS,
               V_QLZSZHJSBRYS,
               V_QLSFRYS,
               V_QLGZDXRYS,
               V_LGDW,
               V_KSYDW,
               V_JFDW,
               V_QTDW,
               V_DWZS,
               V_WLHRK,
               V_CYRYS,
               V_QBXXS,
               V_ZAPCS
          FROM V_COMMON_ORGANIZATION T
         WHERE ORGCODE = LIST(I).ORGCODE;

        SELECT COUNT(1)
          INTO V_RECORD
          FROM T_COMMON_XQTJQK
         WHERE ORGCODE = V_ORGCODE;
        IF V_RECORD <= 0 THEN
          INSERT INTO T_COMMON_XQTJQK
            (ORGCODE,
             ORGNAME,
             PARENT_CODE,
             LEVE,
             CZRKS,
             LDRKS,
             FWS,
             CZFWS,
             ZDDXS,
             XDRYS,
             JSBRS,
             TZHYS,
             GGCSS,
             NBDWS,
             WXPDWS,
             SWCSS,
             SWDWS,
             JWRKS,
             JZRKS,
             STS,
             QLSDRYS,
             QLSWRYS,
             QLZTRYS,
             QLXSFZRYS,
             QLZSZHJSBRYS,
             QLSFRYS,
             QLSKRYS,
             QLGZDXRYS,
             LGCS,
             KSYDW,
             JFDW,
             QTDW,
             DWZS,
             WLHRKS,
             CYRYS,
             QBXXS,
             ZAPCS)
          VALUES
            (V_ORGCODE,
             V_ORGNAME,
             V_PARENTCODE,
             V_LEVE,
             V_CZRKS,
             V_LDRKS,
             V_FWS,
             V_CZFWS,
             V_ZDDXS,
             V_QLSDRYS,
             V_QLZSZHJSBRYS,
             V_TZHYS,
             V_GGCSS,
             V_NBDWS,
             V_WXPDWS,
             V_SWCSS,
             V_SWDWS,
             V_JWRKS,
             V_JZRKS,
             V_STS,
             V_QLSDRYS,
             V_QLSWRYS,
             V_QLZTRYS,
             V_QLXSFZRYS,
             V_QLZSZHJSBRYS,
             V_QLSFRYS,
             V_QLSKRYS,
             V_QLGZDXRYS,
             V_LGDW,
             V_KSYDW,
             V_JFDW,
             V_QTDW,
             V_DWZS,
             V_WLHRK,
             V_CYRYS,
             V_QBXXS,
             V_ZAPCS);
        ELSE
          UPDATE T_COMMON_XQTJQK
             SET CZRKS        = V_CZRKS,
                 LDRKS        = V_LDRKS,
                 JWRKS        = V_JWRKS,
                 JZRKS        = V_JZRKS,
                 FWS          = V_FWS,
                 CZFWS        = V_CZFWS,
                 ZDDXS        = V_ZDDXS,
                 XDRYS        = V_XDRYS,
                 JSBRS        = V_JSBRS,
                 TZHYS        = V_TZHYS,
                 GGCSS        = V_GGCSS,
                 NBDWS        = V_NBDWS,
                 WXPDWS       = V_WXPDWS,
                 SWCSS        = V_SWCSS,
                 SWDWS        = V_SWDWS,
                 GXSJ         = SYSDATE,
                 STS          = V_STS,
                 QLSDRYS      = V_QLSDRYS,
                 QLSWRYS      = V_QLSWRYS,
                 QLZTRYS      = V_QLZTRYS,
                 QLXSFZRYS    = V_QLXSFZRYS,
                 QLZSZHJSBRYS = V_QLZSZHJSBRYS,
                 QLSFRYS      = V_QLSFRYS,
                 QLSKRYS      = V_QLSKRYS,
                 QLGZDXRYS    = V_QLGZDXRYS,
                 ORGNAME        = V_ORGNAME,
                 LGCS         = V_LGDW,
                 KSYDW        = V_KSYDW,
                 JFDW         = V_JFDW,
                 QTDW         = V_QTDW,
                 DWZS         = V_DWZS,
                 WLHRKS = V_WLHRK,
                 CYRYS        = V_CYRYS,
                 QBXXS        = V_QBXXS,
                 ZAPCS        = V_ZAPCS
           WHERE ORGCODE = LIST(I).ORGCODE;
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
          V_ERROR := SQLERRM;
      END;
      COMMIT;
    END LOOP;
  END LOOP;
  CLOSE CUR_LIST;
END P_EXEC_ORGCODEXQTJ;
/



