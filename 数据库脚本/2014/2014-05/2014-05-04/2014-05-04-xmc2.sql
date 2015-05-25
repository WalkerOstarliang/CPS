alter table t_za_ry_cyry add SFDJSYRK varchar2(1);
alter table t_za_ry_cyry add SYRKDJSJ date;
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

    TYPE TYPE_LIST IS TABLE OF CUR_CYRY_LIST%ROWTYPE;
    LIST     TYPE_LIST;
    V_SFZH   VARCHAR2(20);
    V_DJSJ   DATE;
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
              SET FKRXM='系统自动反馈',
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
END;
/