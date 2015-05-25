create or replace function f_get_rylb(sfzh varchar2, fwid varchar2)
return varchar2
--sfzh：身份证号
--fwid：房屋ID
as
       v_rylb     varchar2(2);
       v_sfzh    varchar2(18);
       v_fwid    varchar2(30);
       v_hjdqh   varchar2(6);
       v_xzdqh   varchar2(6);
       v_rycount number;
begin
       v_sfzh:=sfzh;
       v_fwid:=fwid;
       
       --查找是否存在常住人口信息
       select count(1) into v_rycount from T_LSGL_RK_CZRK where sfzh=v_sfzh and (ZXBS='0' or zxbs is null);
       
       if v_rycount > 0 then 
           --户籍地信息
           select hjdqh into v_hjdqh from T_LSGL_RK_CZRK where sfzh=v_sfzh and (ZXBS='0' or zxbs is null) and rownum=1;
           
           --现住地信息区划，派出所代码
           select substr(SSZRDWDM,1,6) into v_xzdqh from t_lsgl_fw_jbxx where fwid=v_fwid;
 
           if v_hjdqh is not null then
             --常口 在本行政区划
             if v_hjdqh = v_xzdqh then
                v_rylb := '1';
                
              --寄住人口  跨行政区划的。本市人员
             elsif substr(v_hjdqh,1,4)=substr(v_xzdqh,1,4) and v_hjdqh <> v_xzdqh then
                v_rylb := '5';
             --流动人口 跨设区的市市区 
             elsif substr(v_hjdqh,1,4) <> substr(v_xzdqh,1,4) then
                v_rylb := '2';
             else
                 v_rylb := '2';
             end if;
           else
             --流动人口
             v_rylb := '2';
           end if;
       --流动人口
       else
           v_rylb := '2';
       end if;
       return v_rylb;
end;
/

CREATE OR REPLACE VIEW V_LSGL_RK_JBXX AS
SELECT /*+index(JBXX T_LSGL_RK_JBXX_SFZH)*/ JBXX.RYBH,
       JBXX.XM,
       JBXX.XMPY,
       JBXX.SFZH,
       JBXX.XB,
       JBXX.GJ,
       JBXX.MZ,
       TO_CHAR(JBXX.CSRQ,'yyyy-MM-dd') AS CSRQ,
       JBXX.BMCH,
       JBXX.BYZK,
       JBXX.YWM,
       JBXX.WHCD,
       JBXX.ZJZL,
       JBXX.ZJHM,
       JBXX.ZZMM,
       JBXX.HYZK,
       JBXX.SG,
       JBXX.XX,
       JBXX.ZZXY,
       JBXX.ZC,
       JBXX.LXDH,
       JBXX.FWCS,
       JBXX.ZYDM,
       JBXX.ZW,
       JBXX.SF,
       JBXX.JG,
       JBXX.RYSX,
       JBXX.RYLB,
       CZRK.HJDQH,
       CZRK.HJDXZ,
       CZRK.QTZZSSXQ,
       CZRK.QTZZXZ,
       CZRK.ZZSSXQ,
       CZRK.ZZXZ,
       CZRK.Bdsj,
       CZRK.SSGAJGJGDM,
       CZRK.SSGAJGJGMC,
       CZRK.SSPCSDM,
       CZRK.SSPCSMC,
       CZRK.ZRDWDM,
       CZRK.ZRDWMC,
       CZRK.ZRMJXM,
       '1'  AS RN
  FROM T_LSGL_RK_JBXX JBXX
  LEFT JOIN T_LSGL_RK_CZRK CZRK ON JBXX.RYBH=CZRK.RYBH;

  
  CREATE OR REPLACE VIEW V_LSGL_RK_CZRK AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
      B.YWM,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      B.RYLB,
      C.CZRKBH,
      C.HH,
      C.HKLB,
      C.YHZGX,
      C.HKXZ,
      C.BDYY,
      TO_CHAR(C.BDSJ,'YYYY-MM-DD') AS BDSJ,
      C.BDQH,
      C.BDXZ,
      C.QRYY,
      TO_CHAR(C.QRSJ,'YYYY-MM-DD') AS QRSJ,
      C.HDQR,
      C.HDQRXZ,
      C.RYZT,
      C.BZ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.ZZSSXQ,
      C.ZZXZ,
      C.QTZZSSXQ,
      C.QTZZXZ,
      rpad(trim(C.SSGAJGJGDM),12,'0') as SSGAJGJGDM,
      C.SSGAJGJGMC,
      rpad(trim(C.SSPCSDM),12,'0') as SSPCSDM,
      C.SSPCSMC,
      C.JHRYXM,
      C.YJHRYGX,
      C.JHREXM,
      C.YJHREGX,
      C.HJDQH,
      C.HJDXZ,
      C.RKFWGLID,
      '1' AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_CZRK C ON B.RYBH = C.RYBH;
  