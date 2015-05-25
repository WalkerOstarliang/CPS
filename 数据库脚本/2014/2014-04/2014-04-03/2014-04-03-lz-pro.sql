CREATE OR REPLACE FUNCTION F_SQJW_TX_CZFW_LDRK(V_ORGCODE VARCHAR2,
                                               V_LX      VARCHAR2)

  -- 社区警务提醒  不能格式化
  /*
  参数说明：
    V_ORGCODE  -- 机构编号
    V_LX       -- 提醒类型
                  GZPT_GZTX1  流动人口
                  GZPT_GZTX2  从业人员
                  GZPT_GZTX3  重点人员托管
                  GZPT_GZTX4  重点人员在控
                  GZPT_GZTX5  出租房屋巡查登记
                  GZPT_GZTX6  出租房屋登记提醒
                  GZPT_GZTX7  实体标注
                  ALL         查询所有
  调用方式：

  SELECT * FROM TABLE(F_SQJW_TX_CZFW_LDRK('430102453101','1'));

  */

 RETURN TABLE_SQJW_TX_NR AS

  V_TABLE_SQJW_TX_NR TABLE_SQJW_TX_NR := TABLE_SQJW_TX_NR();
  V_TYPE_SQJW_TX_NR  TYPE_SQJW_TX_NR := TYPE_SQJW_TX_NR('', '', '', '');

  V_TX_NR      VARCHAR2(4000); -- 返回提醒内容
  V_TX_DZ      VARCHAR2(4000); --  返回提醒地址
  V_TX_SQJWURL VARCHAR2(200); --社区警务地址

  --出租房屋巡查登记提醒
  CURSOR GETDATALIST(V_ORGCODE VARCHAR) IS
    SELECT SFCZW,
           DZMC,
           TO_CHAR(LAST_TIME, 'YYYY-MM-DD') LAST_TIME,
           TO_CHAR(LAST_TIME + 122, 'YYYY-MM-DD') NEXT_TIME,
           FDSYRXM,
           FDSYRLXDH,
           CZFWID,
           CZFWBPBM,
           FWID
      FROM (SELECT FW.SFCZW,
                   FW.FDSYRXM,
                   FW.FDSYRLXDH,
                   FW.FWID CZFWID,
                   F_GET_DZMC(FW.DZID) DZMC,
                   CZ.CZFWBPBM,
                   FW.FWID FWID,
                   NVL((SELECT MAX(XCDJ.DJSJ)
                         FROM T_LSGL_FW_CZWXCDJ XCDJ
                        WHERE XCDJ.FWID = FW.FWID),
                       (SELECT MAX(CZFW.DJSJ)
                          FROM T_LSGL_CZFW_JBXX CZFW
                         WHERE CZFW.FWBH = FW.FWID)) LAST_TIME
              FROM T_LSGL_FW_JBXX FW, T_LSGL_CZFW_JBXX CZ
             WHERE FW.FWID = CZ.FWBH  and cz.czsj is not null 
               AND CZ.FWZT = '0'
               and (fw.zxbs ='0' or fw.zxbs is null)
               AND FW.SFCZW = '1'
               AND FW.CQLX = '2'
               AND FW.DJDWDM = V_ORGCODE) FWTX
     WHERE (FWTX.LAST_TIME + 112) < SYSDATE;
  
  --流动人口居住到期提醒
  CURSOR GETDATALIST1(V_ORGCODE VARCHAR) IS
    SELECT LD.ZZBH,
           JB.RYBH,
           JB.SFZH,
           JB.XM,
           JB.XB,
           TO_CHAR(NJZRQ, 'YYYY-MM-DD') AS NJZRQ,
           LD.ZZDXZ,
           JB.LXDH
      FROM T_LSGL_RK_LDRKZZXX LD
     INNER JOIN T_LSGL_RK_JBXX JB
        ON LD.RYBH = JB.RYBH
     WHERE NJZRQ >  (sysdate - 31)    and 
   NJZRQ < (sysdate + 10) 
       AND LD.ZXSJ IS NULL
       AND ZRDWDM = V_ORGCODE;
  
  --出租房屋登记提醒
  CURSOR GETDATALIST2(V_ORGCODE VARCHAR) IS
    SELECT FWID, F_GET_DZMC(DZID) AS DZMC, A.FDSYRXM, A.FDSYRLXDH
      FROM T_LSGL_FW_JBXX A
     WHERE A.SFCZW = '0' 
       AND (A.ZXBS='0' OR A.ZXBS IS NULL)
       AND FWID IN
           (SELECT FWID
              FROM T_LSGL_RKFW_GL
             WHERE RKFWGLID IN (SELECT RKFWGLID
                                  FROM T_LSGL_RK_LDRKZZXX
                                 WHERE ZZCS = '34'
                                   AND ZXBS = '0'
                                   AND ZRDWDM = V_ORGCODE))
       AND (HZXM IS NULL OR HZSFZH IS NULL);
  
  --重点人员委托
  CURSOR GETDATALIST3(V_ORGCODE VARCHAR) IS
    SELECT T.ID TGXXID,
           C.RYBH,
           C.XM,
           A.SFZH,
           T.WTRXM WTRXM,
           T.WTDWMC WTDWMC,
           TO_CHAR(T.WTSJ, 'YYYY-MM-DD HH24:MI:SS') WTSJ,
           TO_CHAR((T.WTSJ + 6), 'YYYY-MM-DD HH24:MI:SS') CLSJ
      FROM T_ZDRY_WTXX T, T_ZDRY_GZDX A, T_LSGL_RK_JBXX C
     WHERE A.SFZH = T.SFZH
       AND A.RYBH = C.RYBH
       AND T.JGZT = '0'
       AND T.JGDWDM = V_ORGCODE
       AND (A.YXX = '1' OR A.YXX IS NULL);
  --在控登记
  CURSOR GETDATALIST4(V_ORGCODE VARCHAR) IS
    
select rk.xm,rk.sfzh,rk.lxdh,(select max(djsj) from t_zdry_xsbx where sfzh = rk.sfzh) as last_time,rk.xzzxz
from t_zdry_gzdx zdry,t_lsgl_rk_jbxx rk
where zdry.rybh = rk.rybh
and (zdry.sfzh in 
        (select sfzh
         from (select rybh,sfzh,djsj,row_number() over(partition by sfzh order by djsj desc) as sn
               from t_zdry_xsbx
               where djdwdm = V_ORGCODE and sfzh is not null)
         where sn = '1'
         and to_char(djsj, 'yyyymm') != to_char(sysdate, 'yyyymm')) 
     or 
     zdry.sfzh not in
     (select sfzh from t_zdry_xsbx where djdwdm = V_ORGCODE and sfzh is not null))   
and zdry.sszrdwdm =V_ORGCODE
and (zdry.yxx is null or zdry.yxx = '1') ;
  
  --实体信息标注提醒
  CURSOR GETDATALIST5(V_ORGCODE VARCHAR) IS
    SELECT ID,
           STMC,
           REPLACE(JDXZMC, '湖南省长沙市', '') || SQMC || JLXMC || MPH || XQZ || LDXZ STDZ
      FROM T_COMMON_STXX
     WHERE DJDWDM = V_ORGCODE
       AND ( ZXBS = '1' or zxbs is null ) and x is null and y is null ;

  --从业登记提醒
  CURSOR GETDATALIST6(V_ORGCODE VARCHAR) IS
    SELECT B.RYBH,
           B.SFZH,
           B.XM,
           C.CYRYBH,
           (SELECT DWMC FROM T_ZA_JG_JBXX WHERE JGBH = C.JGBH) AS DWMC,
           C.XZDZ,
           NVL(C.SJHM, C.QTLXDH) LXDH
      FROM T_ZA_RY_CYRY C
     INNER JOIN T_LSGL_RK_JBXX B
        ON C.RYBH = B.RYBH
     WHERE c.XZDJWQ = V_ORGCODE
       AND c.FKSJ IS NULL
       and c.zxbs != '1'
       and c.czbs != '3'
       AND (NOT EXISTS
            (SELECT 1
               FROM T_LSGL_RK_CZRK CZ
              WHERE CZ.RYBH = C.RYBH
                AND CZ.DJDWDM = V_ORGCODE) AND NOT EXISTS
            (SELECT 1
               FROM T_LSGL_RK_LDRKZZXX CZ
              WHERE CZ.RYBH = C.RYBH
                AND CZ.DJDWDM = V_ORGCODE) AND NOT EXISTS
            (SELECT 1
               FROM T_LSGL_RK_JZRKXX CZ
              WHERE CZ.RYBH = C.RYBH
                AND CZ.DJDWDM = V_ORGCODE));

  TYPE LISTTYPE IS TABLE OF GETDATALIST%ROWTYPE;

  R_RK LISTTYPE;

  TYPE LISTTYPE1 IS TABLE OF GETDATALIST1%ROWTYPE;
  R_RK1 LISTTYPE1;

  TYPE LISTTYPE2 IS TABLE OF GETDATALIST2%ROWTYPE;
  R_RK2 LISTTYPE2;

  TYPE LISTTYPE3 IS TABLE OF GETDATALIST3%ROWTYPE;
  R_RK3 LISTTYPE3;

  TYPE LISTTYPE4 IS TABLE OF GETDATALIST4%ROWTYPE;
  R_RK4 LISTTYPE4;

  TYPE LISTTYPE5 IS TABLE OF GETDATALIST5%ROWTYPE;
  R_RK5 LISTTYPE5;

  TYPE LISTTYPE6 IS TABLE OF GETDATALIST6%ROWTYPE;
  R_RK6 LISTTYPE6;

BEGIN

  V_TX_SQJWURL := 'HTTP://10.143.1.200:8250/CPS';
  
  ---- 流动人口到期提醒配置
  IF V_LX = 'GZPT_GZTX1' OR V_LX = 'ALL' THEN

    OPEN GETDATALIST1(V_ORGCODE);

    LOOP
      FETCH GETDATALIST1 BULK COLLECT
        INTO R_RK1 LIMIT 1000;

      EXIT WHEN R_RK1.COUNT = 0;

      FOR I IN R_RK1.FIRST .. R_RK1.LAST LOOP

        V_TX_NR := '流动人口【' || R_RK1(I).XM || ',' || R_RK1(I).SFZH || '】,' || '将于' || R_RK1(I)
                  .NJZRQ || '居住到期,' || '现住【' || R_RK1(I).ZZDXZ || '】,' ||
                   '联系电话 【' || R_RK1(I).LXDH || '】,请及时处理';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/lsgl/rk/toLdrkYanQi.action?rkBean.ldrkBean.' ||
                   'rybh=' || R_RK1(I).RYBH || '&zzbh=' || R_RK1(I).ZZBH;

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '流动人口';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX1';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST1;

  END IF;
  ----  从业人员核实提醒
  IF V_LX = 'GZPT_GZTX2' OR V_LX = 'ALL' THEN
    OPEN GETDATALIST6(V_ORGCODE);
    LOOP
      FETCH GETDATALIST6 BULK COLLECT
        INTO R_RK6 LIMIT 1000;
      EXIT WHEN R_RK6.COUNT = 0;

      FOR I IN R_RK6.FIRST .. R_RK6.LAST LOOP

        V_TX_NR := '从业人员住址核实提醒，' || R_RK6(I).DWMC || '的从业人员【姓名:' || R_RK6(I).XM ||
                   '，身份证:' || R_RK6(I).SFZH || '，电话号码:' || R_RK6(I).LXDH ||
                   '】在您的辖区内居住，地址：' || R_RK6(I).XZDZ ||
                   '，请进行核实是否属实，并登记实有人口信息';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/zagl/dw/toCyryDetail.action?dw.cyry.cyrybh=' || R_RK6(I)
                  .CYRYBH || '&dw.opertype=update&isxttxpage=true';

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '从业人员';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX2';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST6;
  END IF;
  ----  重点人员托管
  IF V_LX = 'GZPT_GZTX3' OR V_LX = 'ALL' THEN
    OPEN GETDATALIST3(V_ORGCODE);
    LOOP
      FETCH GETDATALIST3 BULK COLLECT
        INTO R_RK3 LIMIT 1000;
      EXIT WHEN R_RK3.COUNT = 0;

      FOR I IN R_RK3.FIRST .. R_RK3.LAST LOOP
        V_TX_NR := '重点人员【' || R_RK3(I).XM || '，' || R_RK3(I).SFZH || '】 由【' || R_RK3(I)
                  .WTRXM || '，' || R_RK3(I).WTDWMC || '】向您发起托管请求，请您在' || R_RK3(I).CLSJ ||
                   '前及时处理';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/lsgl/zdry/toZdryJgPage.action?a=b&zdryBean.tgxxId=' || R_RK3(I)
                  .TGXXID ||
                   '&queryBean.rybh='||R_RK3(I).RYBH||'&operType=update';

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '重点人员托管';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX3';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST3;
  END IF;

  ----  重点人员在控
  IF V_LX = 'GZPT_GZTX4' OR V_LX = 'ALL' THEN
    OPEN GETDATALIST4(V_ORGCODE);
    LOOP
      FETCH GETDATALIST4 BULK COLLECT
        INTO R_RK4 LIMIT 1000;
      EXIT WHEN R_RK4.COUNT = 0;

      FOR I IN R_RK4.FIRST .. R_RK4.LAST LOOP

        V_TX_NR := '重点人员【' || R_RK4(I).XM || '，' || R_RK4(I).SFZH ||
                   '】，需要进行在控登记,上次登记时间为【' || R_RK4(I)
                  .LAST_TIME || '】，现住【' || R_RK4(I).XZZXZ || '】，联系电话 【' || R_RK4(I).LXDH ||
                   '】，请及时处理';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/lsgl/zdry/toZdryInfoPage.action?a=b&operType=update&queryBean.sfzh=' || R_RK4(I).SFZH ||
                   '&showMenu=showMenu';

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '重点人员在控';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX4';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST4;
  END IF;

  ----出租房屋巡查登记
  IF V_LX = 'GZPT_GZTX5' OR V_LX = 'ALL' THEN

    OPEN GETDATALIST(V_ORGCODE);

    LOOP
      FETCH GETDATALIST BULK COLLECT
        INTO R_RK LIMIT 1000;

      EXIT WHEN R_RK.COUNT = 0;

      FOR I IN R_RK.FIRST .. R_RK.LAST LOOP

        V_TX_NR := '出租房编号:【' || R_RK(I).CZFWBPBM || '】,' || '房屋地址【' || R_RK(I).DZMC || '】,' ||
                   '到期巡查提醒, 你上次检查时间为:【' || R_RK(I).LAST_TIME || '】,' ||
                   '需在【' || R_RK(I).NEXT_TIME || '】号前完成巡查工作,' || '房主姓名【' || R_RK(I)
                  .FDSYRXM || '】,' || '联系电话【' || R_RK(I).FDSYRLXDH || '】,' ||
                   '请按要求及时对对应房屋进行核实检查.';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/lsgl/fw/toFwxcInfoPage.action?operType=update&queryBean.' ||
                   'fwid=' || R_RK(I).FWID;

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '出租房屋巡查登记';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX5';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST;

  END IF;

  ---- 出租房屋登记提醒
  IF V_LX = 'GZPT_GZTX6' OR V_LX = 'ALL' THEN

    OPEN GETDATALIST2(V_ORGCODE);

    LOOP
      FETCH GETDATALIST2 BULK COLLECT
        INTO R_RK2 LIMIT 1000;

      EXIT WHEN R_RK2.COUNT = 0;

      FOR I IN R_RK2.FIRST .. R_RK2.LAST LOOP

        V_TX_NR := '房屋地址:' || R_RK2(I).DZMC || ',' || '房主姓名【' || R_RK2(I).FDSYRXM || '】,' ||
                   '联系电话【' || R_RK2(I).FDSYRLXDH || '】,' ||
                   '请检查房屋信息是否登记为出租房屋或者出租房屋信息是否登记完善,';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/lsgl/fw/toFwInfoPage.action?operType=update&queryBean.' ||
                   'fwid=' || R_RK2(I).FWID || '&queryBean.sfczw=1';

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '出租房屋登记提醒';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX6';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;
    END LOOP;
    CLOSE GETDATALIST2;
  END IF;

  ----  实体标注提醒
  IF V_LX = 'GZPT_GZTX7' OR V_LX = 'ALL' THEN
    OPEN GETDATALIST5(V_ORGCODE);
    LOOP
      FETCH GETDATALIST5 BULK COLLECT
        INTO R_RK5 LIMIT 1000;
      EXIT WHEN R_RK5.COUNT = 0;

      FOR I IN R_RK5.FIRST .. R_RK5.LAST LOOP

        V_TX_NR := '实体名称【' || R_RK5(I).STMC || '】,地址【' || R_RK5(I).STDZ ||
                   '】未进行标注,请及时标注.';
        V_TX_DZ := V_TX_SQJWURL ||
                   '/dzgl/dzxx/toStxxDetailPageInfo.action?operType=update&stxxBean.id=' || R_RK5(I).ID || '';

        V_TYPE_SQJW_TX_NR.TXNR   := V_TX_NR;
        V_TYPE_SQJW_TX_NR.HREF   := V_TX_DZ;
        V_TYPE_SQJW_TX_NR.TITLE  := '实体标注';
        V_TYPE_SQJW_TX_NR.SSMKBH := 'GZPT_GZTX7';

        V_TABLE_SQJW_TX_NR.EXTEND;
        V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

      END LOOP;

    END LOOP;

    CLOSE GETDATALIST5;
  END IF;
  ----------------
  RETURN V_TABLE_SQJW_TX_NR;

EXCEPTION
  WHEN OTHERS THEN
    V_TYPE_SQJW_TX_NR.TXNR := '函数外围异常';

    V_TABLE_SQJW_TX_NR.EXTEND;
    V_TABLE_SQJW_TX_NR(V_TABLE_SQJW_TX_NR.COUNT) := V_TYPE_SQJW_TX_NR;

    RETURN V_TABLE_SQJW_TX_NR;

END F_SQJW_TX_CZFW_LDRK;
