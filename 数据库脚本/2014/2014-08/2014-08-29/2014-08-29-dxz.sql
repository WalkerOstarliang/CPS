create table T_COMMON_MJRZ
(
  USERNAME VARCHAR2(30),
  REALNAME VARCHAR2(50),
  ORGCODE  VARCHAR2(12),
  ORGNAME  VARCHAR2(120),
  CZRKS    NUMBER,
  LDRKS    NUMBER,
  JZRKS    NUMBER,
  WLHRKS   NUMBER,
  JWRKS    NUMBER,
  DWS      NUMBER,
  STS      NUMBER,
  FWS      NUMBER,
  CZFWS    NUMBER,
  CYRYS    NUMBER,
  TJRQ     DATE,
  WEEK     VARCHAR2(20),
  JSSJ     DATE
);
-- Add comments to the table 
comment on table T_COMMON_MJRZ
  is '民警日志';
-- Add comments to the columns 
comment on column T_COMMON_MJRZ.USERNAME
  is '警号';
comment on column T_COMMON_MJRZ.REALNAME
  is '姓名';
comment on column T_COMMON_MJRZ.ORGCODE
  is '单位代码';
comment on column T_COMMON_MJRZ.ORGNAME
  is '单位名称';
comment on column T_COMMON_MJRZ.CZRKS
  is '常住人口数';
comment on column T_COMMON_MJRZ.LDRKS
  is '流动人口数';
comment on column T_COMMON_MJRZ.JZRKS
  is '寄住人口数';
comment on column T_COMMON_MJRZ.WLHRKS
  is '未落户人口数';
comment on column T_COMMON_MJRZ.JWRKS
  is '境外人口数';
comment on column T_COMMON_MJRZ.DWS
  is '单位数';
comment on column T_COMMON_MJRZ.STS
  is '实体数';
comment on column T_COMMON_MJRZ.FWS
  is '房屋数';
comment on column T_COMMON_MJRZ.CZFWS
  is '出租房屋数';
comment on column T_COMMON_MJRZ.CYRYS
  is '从业人员数';
comment on column T_COMMON_MJRZ.TJRQ
  is '统计日期';
comment on column T_COMMON_MJRZ.WEEK
  is '星期';    
comment on column T_COMMON_MJRZ.JSSJ
  is '计算时间';
  
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
       SYSDATE AS jssj
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

      sql_insert VARCHAR2(4000) := ' insert into T_COMMON_MJRZ
      (
username	,
realname	,
orgcode	,
orgname	,
czrks	,
ldrks	,
jzrks	,
wlhrks	,
jwrks	,
dws	,
sts	,
fws	,
czfws	,
cyrys	,
tjrq	,
week	,
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
                     using list(i).	username	,
                            list(i).	realname	,
                            list(i).	orgcode	,
                            list(i).	orgname	,
                            list(i).	czrks	,
                            list(i).	ldrks	,
                            list(i).	jzrks	,
                            list(i).	wlhrks	,
                            list(i).	jwrks	,
                            list(i).	dws	,
                            list(i).	sts	,
                            list(i).	fws	,
                            list(i).	czfws	,
                            list(i).	cyrys	,
                            list(i).	tjrq	,
                            list(i).	week	,
                            list(i).	jssj	 ;

                  V_XZL := V_XZL + 1;
                EXCEPTION
                   WHEN OTHERS THEN
                     V_YCL := V_YCL + 1;
                     execute immediate SQL_ERR
                     USING 'P_EXEC_MJRZ', V_JSSJ, V_KSSJ, LIST(I).orgcode, SQLERRM;

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
 / 
begin
  sys.dbms_job.submit(job => :job,
                      what => 'P_EXEC_MJRZ;',
                      next_date => to_date('30-08-2014 01:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'trunc(sysdate)+1+1/24');
  commit;
end;
/