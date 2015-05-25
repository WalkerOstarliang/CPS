-- Add/modify columns 
alter table T_GZGL_GZRZ add sfxtcs varchar2(1) default 0;
-- Add comments to the columns 
comment on column T_GZGL_GZRZ.sfxtcs
  is '是否系统生成：1,：是  0：否';
  

CREATE OR REPLACE PROCEDURE P_EXEC_MJRZ
IS

    cursor getlist--(kssj VARCHAR2, jssj VARCHAR2)
      is
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
       TRUNC(SYSDATE -1 ,'dd') AS tjrq,
       to_char(SYSDATE - 1 ,'day') AS week,
       SYSDATE AS jssj,
       u.sfzh
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


      TYPE gettype IS TABLE OF getlist%ROWTYPE;
      list         gettype;

  SQL_LOG VARCHAR2(4000) := 'INSERT INTO T_SQJW_LOG( JHDXBM, SJFW_SX, SJFW_XX, SJZL, XZL, GXL, YCL, GCWWYCXX ) VALUES(:PART1,:PART2,:PART3,:PART4,:PART5,:PART6,:PART7,:PART8)';

  SQL_ERR VARCHAR2(4000) := 'INSERT INTO T_SQJW_ERR_DATA( JHDXBM, SJFW_SX, SJFW_XX, YCSJZJ, SJCZYCXX )VALUES(:PART1,:PART2,:PART3,:PART4,:PART5)';

  V_KSSJ VARCHAR2(17);
  V_JSSJ VARCHAR2(17);
  V_SJZL NUMBER := 0;
  V_XZL  NUMBER := 0;
  V_YCL  NUMBER := 0;
  
  v_syrks number := 0;
  v_zs    number := 0;

      sql_insert VARCHAR2(4000) := ' insert into T_COMMON_MJRZ
      (
username  ,
realname  ,
orgcode  ,
orgname  ,
czrks  ,
ldrks  ,
jzrks  ,
wlhrks  ,
jwrks  ,
dws  ,
sts  ,
fws  ,
czfws  ,
cyrys  ,
tjrq  ,
week  ,
jssj
)
values
(
:part1,
:part2,
:part3,
:part4,
:part5,
:part6,
:part7,
:part8,
:part9,
:part10,
:part11,
:part12,
:part13,
:part14,
:part15,
:part16,
:part17
)';


sql_insert_1 VARCHAR2(4000) := 'insert into t_gzgl_gzrz(rzbh	,
rzbt  ,
gzmjxm  ,
gzmjsfzh  ,
gzmjjh  ,
gzmjdwdm  ,
gzmjdwmc  ,
gzrq  ,
gznrms  , 
djrxm  ,
djsj	,
djdwdm	,
djdwmc	,
djmjjh	,
czbz	,
gxsj	,
djrsfzh,
sfxtcs	)
values(
:part1,
:part2,
:part3,
:part4,
:part5,
:part6,
:part7,
:part8,
:part9,
:part10,
:part11,
:part12,
:part13,
:part14,
:part15,
:part16,
:part17,
:part18
)';

BEGIN

        open getlist;--(V_KSSJ, V_JSSJ);

        loop
             fetch getlist bulk collect
             into  list limit 1000;

             exit when list.count=0;

             for i in list.first .. list.last loop

              V_SJZL := V_SJZL + 1;

                BEGIN
                   execute immediate sql_insert
                     using list(i).  username  ,
                            list(i).  realname  ,
                            list(i).  orgcode  ,
                            list(i).  orgname  ,
                            list(i).  czrks  ,
                            list(i).  ldrks  ,
                            list(i).  jzrks  ,
                            list(i).  wlhrks  ,
                            list(i).  jwrks  ,
                            list(i).  dws  ,
                            list(i).  sts  ,
                            list(i).  fws  ,
                            list(i).  czfws  ,
                            list(i).  cyrys  ,
                            list(i).  tjrq  ,
                            list(i).  week  ,
                            list(i).  jssj   ;

                  V_XZL := V_XZL + 1;
                EXCEPTION
                   WHEN OTHERS THEN
                     V_YCL := V_YCL + 1;
                     execute immediate SQL_ERR
                     USING 'P_EXEC_MJRZ', V_JSSJ, V_KSSJ, LIST(I).orgcode, SQLERRM;

                END;
                
                v_syrks := list(i).czrks + list(i).ldrks + list(i).jzrks + list(i).wlhrks +list(i).jwrks;
                v_zs := v_syrks + list(i).sts + list(i).fws + list(i).czfws + list(i).dws + list(i).cyrys;
                
                BEGIN
                   execute immediate sql_insert_1
                     using  SEQ_GZGL_GZRZ.Nextval ,
                            to_char(list(i).  tjrq,'yyyy-mm-dd') ||list(i).  realname||'日志登记',                     
                            list(i).  realname  ,
                            list(i).  sfzh,
                            list(i).  username  ,
                            list(i).  orgcode  ,
                            list(i).  orgname  ,                             
                            list(i).  tjrq  ,
                            '共采集数据'|| v_zs || '条，'||
                            '其中实体'|| list(i).  sts ||'条，'||
                            '房屋'||list(i).  fws  || '条，'||
                            '出租房屋'||list(i).  czfws  || '条，'||
                            '实有人口'|| v_syrks || '条，'||
                            '单位'|| list(i).  dws || '条，'||
                            '从业人员'|| list(i).  cyrys || '条。',
                            list(i).  realname  ,
                            sysdate,
                            list(i).  orgcode  ,
                            list(i).  orgname  , 
                            list(i).  username  ,
                            '1',
                            sysdate,                            
                            list(i).  sfzh ,
                            '1';

                   
                EXCEPTION
                   WHEN OTHERS THEN 
                     execute immediate SQL_ERR
                     USING 'P_EXEC_MJRZ_1', V_JSSJ, V_KSSJ, LIST(I).orgcode, SQLERRM;

                END;


             end loop;
          commit;
      end loop;

      close getlist;

    EXECUTE IMMEDIATE SQL_LOG
      USING  'P_EXEC_MJRZ', V_JSSJ, V_KSSJ, V_SJZL, V_XZL, 0, V_YCL, '';
      COMMIT;

EXCEPTION
 WHEN OTHERS THEN
    EXECUTE IMMEDIATE SQL_LOG
      USING  'P_EXEC_MJRZ', '', '', 0, 0, 0, 0, SQLERRM;
      COMMIT;
END P_EXEC_MJRZ;
   