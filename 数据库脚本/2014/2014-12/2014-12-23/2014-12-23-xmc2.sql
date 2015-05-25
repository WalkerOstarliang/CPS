CREATE OR REPLACE PROCEDURE P_EXEC_MJRZ
IS

    CURSOR GETLIST--(KSSJ VARCHAR2, JSSJ VARCHAR2)
      IS
      SELECT U.USERNAME,
       U.REALNAME,
       O.ORGCODE,
       O.ORGNAME,
       NVL(CK.SL, 0) AS CZRKS,
       NVL(LK.SL, 0) AS LDRKS,
       NVL(JK.SL, 0) AS JZRKS,
       NVL(WLH.SL, 0) AS WLHRKS,
       NVL(JW.SL, 0) AS JWRKS,
       NVL(DW.SL, 0) AS DWS,
       NVL(CYRY.SL, 0) AS CYRYS,
       NVL(ST.SL, 0) AS STS,
       NVL(FW.SL, 0) AS FWS,
       NVL(CZFW.SL, 0) AS CZFWS,
       TRUNC(SYSDATE -1 ,'DD') AS TJRQ,
       TO_CHAR(SYSDATE - 1 ,'DAY') AS WEEK,
       SYSDATE AS JSSJ,
       U.SFZH
  FROM V_COMMON_ORGUSER OU, V_COMMON_ORGANIZATION O, V_COMMON_USER U
  LEFT JOIN (
             -- 常住人口
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_RK_CZRK CK
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY CK.DJRSFZH) CK
    ON CK.DJRSFZH = U.SFZH
  LEFT JOIN (
             --流动人口
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_RK_LDRKZZXX LK
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY LK.DJRSFZH) LK
    ON LK.DJRSFZH = U.SFZH
  LEFT JOIN (
             --寄住人口
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_RK_JZRKXX JK
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY JK.DJRSFZH) JK
    ON JK.DJRSFZH = U.SFZH
  LEFT JOIN (
             --未落户
             SELECT WLH.DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_RK_WLHCZHK WLH
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY WLH.DJRSFZH) WLH
    ON WLH.DJRSFZH = U.SFZH
  LEFT JOIN (
             --境外人员
             SELECT JW.DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_RK_JWRKXX JW
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY JW.DJRSFZH) JW
    ON JW.DJRSFZH = U.SFZH
  LEFT JOIN (
             --单位
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_ZA_JG_JBXX DW
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND ZXBS = '0'
              GROUP BY DW.DJRSFZH) DW
    ON DW.DJRSFZH = U.SFZH
  LEFT JOIN (
             --从业人员
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_ZA_RY_CYRY CYRY
              WHERE DJSJ >= SYSDATE - 1
                AND DJSJ < SYSDATE
                AND (ZXBS = '0' OR ZXBS IS NULL)
                AND CZBS != '3'
              GROUP BY CYRY.DJRSFZH) CYRY
    ON CYRY.DJRSFZH = U.SFZH
  LEFT JOIN (
             --实体
             SELECT ST.DJRSFZH, COUNT(1) AS SL
               FROM T_COMMON_STXX ST
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND (ZXBS = '1' OR ZXBS IS NULL)
              GROUP BY ST.DJRSFZH) ST
    ON ST.DJRSFZH = U.SFZH
  LEFT JOIN (
             --房屋
             SELECT FW.DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_FW_JBXX FW
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND (ZXBS = '0' OR ZXBS IS NULL)
              GROUP BY FW.DJRSFZH) FW
    ON FW.DJRSFZH = U.SFZH
  LEFT JOIN (
             --出租房屋
             SELECT DJRSFZH, COUNT(1) AS SL
               FROM T_LSGL_CZFW_JBXX CZFW
              WHERE DJSJ > SYSDATE - 1
                AND DJSJ < SYSDATE
                AND (FWZT = '0' OR FWZT IS NULL)
              GROUP BY CZFW.DJRSFZH) CZFW
    ON CZFW.DJRSFZH = U.SFZH
 WHERE ISVALID = '1'
   AND OU.USERID = U.USERID
   AND OU.ORGID = O.ORGID
   AND O.ISYX = '1'
   AND O.LEVE = '5';


      TYPE GETTYPE IS TABLE OF GETLIST%ROWTYPE;
      LIST         GETTYPE;

  SQL_LOG VARCHAR2(4000) := 'INSERT INTO T_SQJW_LOG( JHDXBM, SJFW_SX, SJFW_XX, SJZL, XZL, GXL, YCL, GCWWYCXX ) VALUES(:PART1,:PART2,:PART3,:PART4,:PART5,:PART6,:PART7,:PART8)';

  SQL_ERR VARCHAR2(4000) := 'INSERT INTO T_SQJW_ERR_DATA( JHDXBM, SJFW_SX, SJFW_XX, YCSJZJ, SJCZYCXX )VALUES(:PART1,:PART2,:PART3,:PART4,:PART5)';
  V_CURRENTDATE DATE;
  V_COUNT NUMBER;
  V_GZNRMS  CLOB;
  V_RZBH  VARCHAR2(25);
  V_KSSJ VARCHAR2(17);
  V_JSSJ VARCHAR2(17);
  V_SJZL NUMBER := 0;
  V_XZL  NUMBER := 0;
  V_YCL  NUMBER := 0;

  V_SYRKS NUMBER := 0;
  V_ZS    NUMBER := 0;

      SQL_INSERT VARCHAR2(4000) := ' INSERT INTO T_COMMON_MJRZ
                (
                  USERNAME  ,
                  REALNAME  ,
                  ORGCODE  ,
                  ORGNAME  ,
                  CZRKS  ,
                  LDRKS  ,
                  JZRKS  ,
                  WLHRKS  ,
                  JWRKS  ,
                  DWS  ,
                  STS  ,
                  FWS  ,
                  CZFWS  ,
                  CYRYS  ,
                  TJRQ  ,
                  WEEK  ,
                  JSSJ
                  )
                  VALUES
                  (
                  :PART1,
                  :PART2,
                  :PART3,
                  :PART4,
                  :PART5,
                  :PART6,
                  :PART7,
                  :PART8,
                  :PART9,
                  :PART10,
                  :PART11,
                  :PART12,
                  :PART13,
                  :PART14,
                  :PART15,
                  :PART16,
                  :PART17
                  )';


          SQL_INSERT_1 VARCHAR2(4000) := 'INSERT INTO T_GZGL_GZRZ(RZBH  ,
                    RZBT  ,
                    GZMJXM  ,
                    GZMJSFZH  ,
                    GZMJJH  ,
                    GZMJDWDM  ,
                    GZMJDWMC  ,
                    GZRQ  ,
                    GZNRMS  ,
                    DJRXM  ,
                    DJSJ  ,
                    DJDWDM  ,
                    DJDWMC  ,
                    DJMJJH  ,
                    CZBZ  ,
                    GXSJ  ,
                    DJRSFZH,
                    SFXTCS  )
                    VALUES(
                    :PART1,
                    :PART2,
                    :PART3,
                    :PART4,
                    :PART5,
                    :PART6,
                    :PART7,
                    :PART8,
                    :PART9,
                    :PART10,
                    :PART11,
                    :PART12,
                    :PART13,
                    :PART14,
                    :PART15,
                    :PART16,
                    :PART17,
                    :PART18
                    )';

BEGIN
        V_CURRENTDATE:=SYSDATE;
        OPEN GETLIST;--(V_KSSJ, V_JSSJ);

        LOOP
             FETCH GETLIST BULK COLLECT
             INTO  LIST LIMIT 1000;

             EXIT WHEN LIST.COUNT=0;

             FOR I IN LIST.FIRST .. LIST.LAST LOOP

              V_SJZL := V_SJZL + 1;

                BEGIN
                   EXECUTE IMMEDIATE SQL_INSERT
                     USING LIST(I).  USERNAME  ,
                            LIST(I).  REALNAME  ,
                            LIST(I).  ORGCODE  ,
                            LIST(I).  ORGNAME  ,
                            LIST(I).  CZRKS  ,
                            LIST(I).  LDRKS  ,
                            LIST(I).  JZRKS  ,
                            LIST(I).  WLHRKS  ,
                            LIST(I).  JWRKS  ,
                            LIST(I).  DWS  ,
                            LIST(I).  STS  ,
                            LIST(I).  FWS  ,
                            LIST(I).  CZFWS  ,
                            LIST(I).  CYRYS  ,
                            LIST(I).  TJRQ  ,
                            LIST(I).  WEEK  ,
                            LIST(I).  JSSJ   ;

                  V_XZL := V_XZL + 1;
                EXCEPTION
                   WHEN OTHERS THEN
                     V_YCL := V_YCL + 1;
                     EXECUTE IMMEDIATE SQL_ERR
                     USING 'P_EXEC_MJRZ', V_JSSJ, V_KSSJ, LIST(I).ORGCODE, SQLERRM;

                END;

                V_SYRKS := LIST(I).CZRKS + LIST(I).LDRKS + LIST(I).JZRKS + LIST(I).WLHRKS +LIST(I).JWRKS;
                V_ZS := V_SYRKS + LIST(I).STS + LIST(I).FWS + LIST(I).CZFWS + LIST(I).DWS + LIST(I).CYRYS;

                BEGIN

                  SELECT COUNT(1) INTO V_COUNT FROM T_GZGL_GZRZ WHERE GZMJJH=LIST(I).USERNAME AND TO_CHAR(GZRQ,'YYYYMMDD')=TO_CHAR(V_CURRENTDATE-1,'YYYYMMDD');

                  IF V_COUNT=0 THEN
                      select SUBSTR(LIST(I).ORGCODE,1,4)||SEQ_GZGL_GZRZ.NEXTVAL into V_RZBH from dual;
                      EXECUTE IMMEDIATE SQL_INSERT_1
                         USING   V_RZBH,
                                TO_CHAR(LIST(I).TJRQ,'YYYY-MM-DD') ||LIST(I).REALNAME||'日志登记',
                                LIST(I).REALNAME,
                                LIST(I).SFZH,
                                LIST(I).USERNAME  ,
                                LIST(I).ORGCODE  ,
                                LIST(I).ORGNAME  ,
                                LIST(I).TJRQ  ,
                                '共采集数据'|| V_ZS || '条，'||
                                '其中实体'|| LIST(I).  STS ||'条，'||
                                '房屋'||LIST(I).  FWS  || '条，'||
                                '出租房屋'||LIST(I).  CZFWS  || '条，'||
                                '实有人口'|| V_SYRKS || '条，'||
                                '单位'|| LIST(I).  DWS || '条，'||
                                '从业人员'|| LIST(I).  CYRYS || '条。',
                                LIST(I).REALNAME  ,
                                SYSDATE,
                                LIST(I).ORGCODE  ,
                                LIST(I).ORGNAME  ,
                                LIST(I).USERNAME  ,
                                '1',
                                SYSDATE,
                                LIST(I).  SFZH ,
                                '1';
                   ELSE
                        SELECT RZBH INTO V_RZBH FROM T_GZGL_GZRZ WHERE GZMJJH=LIST(I).USERNAME AND TO_CHAR(GZRQ,'YYYYMMDD')=TO_CHAR(V_CURRENTDATE-1,'YYYYMMDD') AND ROWNUM<2;
                        V_GZNRMS:='共采集数据'|| V_ZS || '条，'||
                                '其中实体'|| LIST(I).  STS ||'条，'||
                                '房屋'||LIST(I).  FWS  || '条，'||
                                '出租房屋'||LIST(I).  CZFWS  || '条，'||
                                '实有人口'|| V_SYRKS || '条，'||
                                '单位'|| LIST(I).  DWS || '条，'||
                                '从业人员'|| LIST(I).  CYRYS || '条。';

                        UPDATE T_GZGL_GZRZ
                           SET
                               GZMJXM = LIST(I).REALNAME,
                               GZMJSFZH = LIST(I).SFZH,
                               GZMJDWDM = LIST(I).ORGCODE,
                               GZMJDWMC = LIST(I).ORGNAME,
                               GZNRMS = V_GZNRMS,
                               CZBZ = '2',
                               GXSJ = SYSDATE
                         WHERE RZBH = V_RZBH;

                   END IF;

                EXCEPTION
                   WHEN OTHERS THEN
                     EXECUTE IMMEDIATE SQL_ERR
                     USING 'P_EXEC_MJRZ_1', V_JSSJ, V_KSSJ, LIST(I).ORGCODE, SQLERRM;

                END;
             END LOOP;
          COMMIT;
      END LOOP;

      CLOSE GETLIST;

    EXECUTE IMMEDIATE SQL_LOG
      USING  'P_EXEC_MJRZ', V_JSSJ, V_KSSJ, V_SJZL, V_XZL, 0, V_YCL, '';
      COMMIT;

EXCEPTION
 WHEN OTHERS THEN
    EXECUTE IMMEDIATE SQL_LOG
      USING  'P_EXEC_MJRZ', '', '', 0, 0, 0, 0, SQLERRM;
      COMMIT;
END P_EXEC_MJRZ;
/

create index IDX_GZRZ_GZMJJH on T_GZGL_GZRZ (GZMJJH)
  tablespace TS_IDX_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );