create or replace procedure p_exec_jzztj
 is
       v_jssj date;
begin
     v_jssj := trunc(sysdate - 1);
       
insert into t_common_jzztj 
     select 
    org.orgcode,
    org.orgname,
    nvl(dys.dys,0) as jzzdys,    --居住证打印数
    nvl(djs.djs,0) as jzzdjs,    --居住证登记书
    nvl(xbfl.ms,0) as jzzdjms,        --居住证登记 男人数
    nvl(xbfl.ws,0) as jzzdjws,        --居住证登记 女人数
    nvl(qhfl.bss,0) as jzzdjbsrs,     --居住证登记  本省人数
    nvl(qhfl.wss,0) as jzzdjwsrs,     --居住证登记  外省人数
    nvl(fzs.fzs,0) as fzs,            --居住证废证数
    nvl(bds.bds,0) as ysbds,          --居住证遗失补打数
    nvl(lkdjs.lks,0) as ldrkdjs,       --流动人口登记数
    v_jssj as jssj ,       --计算时间 
    sysdate as zxsj
from t_common_organization_sjjs org
 left join 
   
   (
   --居住证打印数
   SELECT djdw, COUNT(1) dys
     FROM t_lsgl_ldrk_jzzxx
    WHERE jzzdyzt = '20'
      AND jzzzxbs = '0'
      and (trunc(zzsj) = v_jssj)
    GROUP BY djdw
   ) dys
   on dys.djdw = org.orgcode

 left join 
 (
 --居住证登记数
 SELECT djdw, COUNT(1) djs
   FROM t_lsgl_ldrk_jzzxx
  WHERE jzzZXBS = '0'
  and trunc(djsj) = v_jssj
  GROUP BY djdw
  ) djs
  on djs.djdw = org.orgcode

left join (
--男，女（居住证登记数）
SELECT djdw,
       SUM(decode(xb, '1', xbs)) AS ms,
       SUM(decode(xb, '2', xbs)) AS ws
  FROM (SELECT djdw, xb, COUNT(1) AS xbs
          FROM t_lsgl_ldrk_jzzxx
         WHERE jzzZXBS = '0'
         and trunc(djsj) = v_jssj
         GROUP BY xb, djdw)
 GROUP BY djdw) xbfl
 on xbfl.djdw = org.orgcode
  
  left join 
 (
 --本省，外省（居住证登记数）
 SELECT djdw,
        SUM(decode(s1, 'bs', zs)) AS bss,
        SUM(decode(s1, 'ws', zs)) AS wss
   FROM (SELECT djdw, s1, COUNT(1) AS zs
           FROM (SELECT djdw, decode(substr(sfzh, 1, 2), '43', 'bs', 'ws') s1
                   FROM t_lsgl_ldrk_jzzxx a
                  WHERE jzzzxbs = '0'
                    AND trunc(djsj) = v_jssj)
          GROUP BY s1, djdw)
  GROUP BY djdw
 )  qhfl
 on qhfl.djdw = org.orgcode
 
 left join
  (
 --废证数
  SELECT djdw, COUNT(1) as fzs
    FROM t_lsgl_ldrk_jzzxx
   WHERE jzzdyzt = '20'
   and jzzzxbs = '1'
   and trunc(jzzzxsj) = v_jssj
   GROUP BY djdw
   ) fzs
   on fzs.djdw = org.orgcode
   
   left join 
  (
  --遗失补打数
  SELECT djdw, COUNT(1) as bds
    FROM t_lsgl_ldrk_jzzxx
   WHERE jzzdyzt = '20'
     AND dyzt = '2'
     and jzzzxbs = '0'
     and trunc(zzsj) = v_jssj
   GROUP BY djdw
   ) bds
   on bds.djdw = org.orgcode
   
   left join
   ( 
   --流口登记数
   SELECT djdwdm, COUNT(1) lks
     FROM t_lsgl_rk_ldrkzzxx
    WHERE zxbs = '0' AND trunc(djsj） = v_jssj GROUP BY djdwdm
    ) lkdjs
    on lkdjs.djdwdm = org.orgcode
    
    where org.leve = '5';
    commit;

end p_exec_jzztj;
/
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
djrsfzh	)
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
:part17
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
                            list(i).  tjrq ||list(i).  realname||'日志登记',                     
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
                            list(i).  sfzh ;

                   
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
 