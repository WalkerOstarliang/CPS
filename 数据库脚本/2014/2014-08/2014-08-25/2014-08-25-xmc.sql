-- Add/modify columns 
alter table T_COMMON_DZJLX add JC VARCHAR2(60);
-- Add comments to the columns 
comment on column T_COMMON_DZJLX.JC
  is '街路巷简称';

  
CREATE OR REPLACE PROCEDURE P_EXEC_CYRY_SYRKDJCHECK
--从业人员 实有人口登记检查
AS
    --未登记实有人口从业人员 没有登记实有人口 或者未反馈
    CURSOR CUR_CYRY_LIST IS
           SELECT CYRYBH,RYBH,JGBH,SFZH,XZDJWQ
           FROM T_ZA_RY_CYRY
           WHERE (SFDJSYRK='0' OR SFDJSYRK IS NULL)
                 AND ZXBS !='1'
                 AND CZBS != '3'
                 AND XZDJWQ IS NOT NULL
                 AND FKSJ IS NULL;
                 
    --查询人员编号为空的数据           
    CURSOR CUR_CYRY_RYBH IS 
           SELECT CYRYBH,SFZH,ZJZL,ZJHM,GJ,YWM,YWX,SFJWRY
           FROM T_ZA_RY_CYRY
           WHERE RYBH IS NULL;
    
    TYPE TYPE_LIST IS TABLE OF CUR_CYRY_LIST%ROWTYPE;
    TYPE TYPE_CYRY_RYBH IS TABLE OF CUR_CYRY_RYBH%ROWTYPE;
    LIST     TYPE_LIST;
    RYBHLIST      TYPE_CYRY_RYBH;
    V_SFZH   VARCHAR2(20);
    V_DJSJ   DATE;
    V_RYBH   VARCHAR2(20);
    V_ERROR  VARCHAR2(3000);
BEGIN
   OPEN CUR_CYRY_LIST;
   LOOP
      FETCH CUR_CYRY_LIST BULK COLLECT INTO LIST LIMIT 100;
      EXIT WHEN LIST.COUNT=0;
      FOR I IN LIST.FIRST .. LIST.LAST LOOP
          BEGIN
              --找实有人口 --常住人口
              SELECT SFZH,DJSJ INTO V_SFZH,V_DJSJ
              FROM (
                     SELECT SFZH,DJSJ,ROWNUM AS RN
                     FROM (
                        SELECT SFZH,DJSJ
                        FROM T_LSGL_RK_CZRK
                        WHERE SFZH=LIST(I).SFZH AND DJDWDM=LIST(I).XZDJWQ AND (ZXBS='0' OR ZXBS IS NULL)

                        UNION ALL

                        SELECT SFZH,DJSJ
                        FROM T_LSGL_RK_LDRKZZXX
                        WHERE SFZH=LIST(I).SFZH AND DJDWDM=LIST(I).XZDJWQ AND (ZXBS='0' OR ZXBS IS NULL)

                        UNION ALL

                        SELECT SFZH,DJSJ
                        FROM T_LSGL_RK_JZRKXX
                        WHERE SFZH=LIST(I).SFZH AND DJDWDM=LIST(I).XZDJWQ AND (ZXBS='0' OR ZXBS IS NULL)

                        UNION ALL

                        SELECT SFZH,DJSJ
                        FROM T_LSGL_RK_WLHCZHK
                        WHERE SFZH=LIST(I).SFZH AND DJDWDM=LIST(I).XZDJWQ AND (ZXBS='0' OR ZXBS IS NULL)
                    )
                    ORDER BY DJSJ DESC
              )
              WHERE RN=1;

              UPDATE T_ZA_RY_CYRY
              SET RYBH=LIST(I).RYBH,
                  FKRXM='系统自动反馈',
                  FKDWMC='系统自动反馈',
                  FKNR='系统自动反馈',
                  FKSJ=SYSDATE,
                  SFDJSYRK='1',
                  SYRKDJSJ=V_DJSJ
              WHERE CYRYBH=LIST(I).CYRYBH;
              COMMIT;

              EXCEPTION WHEN OTHERS THEN
                  V_ERROR:=SQLERRM;
          END;
      END LOOP;
   END LOOP;
   
   --更新人员编号
   OPEN CUR_CYRY_RYBH;
   LOOP
        FETCH CUR_CYRY_RYBH BULK COLLECT INTO RYBHLIST LIMIT 100;
        EXIT WHEN RYBHLIST.COUNT=0;
        FOR I IN RYBHLIST.FIRST .. RYBHLIST.LAST LOOP
            BEGIN
                 IF RYBHLIST(I).SFJWRY='1' THEN
                    --更新人员编号
                    SELECT RYBH INTO V_RYBH
                    FROM T_LSGL_RK_JWRKXX 
                    WHERE GJ=RYBHLIST(I).GJ 
                          AND RJZJZL=RYBHLIST(I).ZJZL
                          AND RJZJHM=RYBHLIST(I).ZJHM
                          AND YWM=RYBHLIST(I).YWM
                          AND YWX=RYBHLIST(I).YWX
                          AND ROWNUM=1;
                    
                    --更新人员编号
                    UPDATE T_ZA_RY_CYRY 
                    SET RYBH=V_RYBH
                    WHERE CYRYBH=RYBHLIST(I).CYRYBH;
                          
                 ELSE
                    SELECT RYBH INTO V_RYBH FROM T_LSGL_RK_JBXX WHERE SFZH=RYBHLIST(I).SFZH AND ROWNUM=1;
                    --更新人员编号
                    UPDATE T_ZA_RY_CYRY 
                    SET RYBH=V_RYBH
                    WHERE CYRYBH=RYBHLIST(I).CYRYBH;
                 END IF;
               EXCEPTION WHEN OTHERS THEN
                           V_ERROR:=SQLERRM;
           END;
        END LOOP;
   
   END LOOP;
END;
/