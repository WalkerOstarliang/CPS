create or replace function F_GET_zdryjgmaxdate(v_sfzh varchar2)
return date
as
       v_maxjgsj  date;
begin
       select max(jgsj) into v_maxjgsj from t_zdry_wtxx where sfzh=v_sfzh and jgsj is not null;
       return v_maxjgsj;
end F_GET_zdryjgmaxdate;
/

CREATE OR REPLACE PROCEDURE P_AUTO_ZDRYZDTG
--重点人员自动托管功能
AS
       --查询上一天登记的实有人口
       CURSOR CUR_LIST IS
           SELECT  RYBH,SFZH,DJDWDM
           FROM (
               SELECT RYBH,SFZH,DJDWDM
               FROM T_LSGL_RK_CZRK CK
               WHERE CK.DJSJ>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'000000','YYYYMMDDHH24MISS')
                     AND CK.DJSJ<=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'235959','YYYYMMDDHH24MISS')

               UNION ALL

               SELECT RYBH,SFZH,DJDWDM
               FROM T_LSGL_RK_LDRKZZXX LK
               WHERE LK.DJSJ>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'000000','YYYYMMDDHH24MISS')
                     AND LK.DJSJ<=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'235959','YYYYMMDDHH24MISS')


               UNION ALL

               SELECT RYBH,SFZH,DJDWDM
               FROM T_LSGL_RK_JZRKXX JK
               WHERE JK.DJSJ>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'000000','YYYYMMDDHH24MISS')
                     AND JK.DJSJ<=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'235959','YYYYMMDDHH24MISS')

               UNION ALL

               SELECT RYBH,SFZH,DJDWDM
               FROM T_LSGL_RK_WLHCZHK WK
               WHERE WK.DJSJ>=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'000000','YYYYMMDDHH24MISS')
                     AND WK.DJSJ<=TO_DATE(TO_CHAR(SYSDATE-1,'YYYYMMDD')||'235959','YYYYMMDDHH24MISS')
           ) J
           WHERE EXISTS (
                     SELECT 1
                     FROM T_ZDRY_GZDX G
                     WHERE J.RYBH=G.RYBH
                         AND NOT EXISTS (
                               SELECT 1
                               FROM T_ZDRY_WTXX W
                               WHERE G.SFZH=W.SFZH
                                    AND (W.JGSJ IS NULL OR (W.JGSJ=F_GET_ZDRYJGMAXDATE(W.SFZH) AND W.JGZT ='1'))
                        )
                    );
  TYPE      LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST       LISTTYPE;
  V_DWCOUNT  NUMBER;
  V_ORGCODE  VARCHAR2(12);
  V_ORGNAME  VARCHAR2(200);
  V_ERROR    VARCHAR2(3000);
  V_FWID     VARCHAR2(100);
  V_SSSQ     VARCHAR2(12);
  V_SSSQMC   VARCHAR2(120);
BEGIN
     OPEN CUR_LIST;
     LOOP
            FETCH CUR_LIST BULK COLLECT INTO LIST LIMIT 100;
            EXIT WHEN LIST.COUNT=0;
            FOR I IN LIST.FIRST .. LIST.LAST LOOP
                BEGIN
                   --找责任单位
                   SELECT COUNT(1) INTO V_DWCOUNT FROM V_COMMON_ORGANIZATION WHERE ORGCODE=LIST(I).DJDWDM;

                   IF V_DWCOUNT>0 THEN
                        SELECT ORGCODE,ORGNAME INTO V_ORGCODE,V_ORGNAME FROM V_COMMON_ORGANIZATION WHERE ORGCODE=LIST(I).DJDWDM;
                   ELSE
                        SELECT JZ_ORG_CODE,(SELECT ORGNAME FROM V_COMMON_ORGANIZATION WHERE ORGCODE=LIST(I).DJDWDM AND ISYX='1' AND ROWNUM=1) INTO  V_ORGCODE,V_ORGNAME FROM CS_JGDM_JZ_JGDM_REAL WHERE CS_ORG_CODE=LIST(I).DJDWDM;
                   END IF;

                   --找行政社区
                   SELECT FWID INTO V_FWID
                   FROM (
                     SELECT FWID,ROWNUM AS SN
                     FROM T_LSGL_RKFW_GL G
                     WHERE RYBH=LIST(I).RYBH AND (ZXBS='0' OR ZXBS IS NULL)
                            ORDER BY DJSJ DESC
                   )
                   WHERE SN=1;

                   SELECT SSSQ,(SELECT MC FROM T_COMMON_HNXZQH WHERE DM=SSSQ) INTO V_SSSQ,V_SSSQMC
                   FROM T_LSGL_FW_JBXX
                   WHERE FWID=V_FWID;

                   IF V_ORGCODE IS NOT NULL AND V_SSSQ IS NOT NULL THEN
                         INSERT INTO T_ZDRY_WTXX
                            (ID, SFZH, WTRXM, WTRJH, WTDWDM, WTDWMC, WTSJ, WTYY, JGRXM, JGRJH, JGDWMC, JGDWDM, JGSJ, THYY, JGZT, WTRLXFS, JGRLXFS, XZSQDM, XZSQMC, TGLX)
                         VALUES
                            (SEQ_ZDRY_WTXX_ID.NEXTVAL, LIST(I).SFZH, '系统自动托管', '', '', '系统自动托管', SYSDATE, '人员住址发生异动', '', NULL, V_ORGNAME, V_ORGCODE, NULL, NULL, '0', NULL, NULL, V_SSSQ, V_SSSQMC, '2');
                   END IF;
                   EXCEPTION WHEN OTHERS THEN
                        V_ERROR:=SQLERRM;
               END;
            END LOOP;
            COMMIT;
     END LOOP;
END;
/