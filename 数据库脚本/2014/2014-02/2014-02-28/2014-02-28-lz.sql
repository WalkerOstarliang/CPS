create or replace view v_lsgl_rk_syrk as
select czrk.czrkbh as rkid,czrk.rybh,czrk.zrdwdm,czrk.czdwdm,czrk.djdwdm,czrk.hjdqh,czrk.hjdxz,'1' as rylb,czrk.zxbs,czrk.rkfwglid
from t_lsgl_rk_czrk czrk

union all

select lk.ZZBH as rkid,lk.rybh,lk.zrdwdm,lk.czdwdm,lk.djdwdm,'' hjdqh,'' hjdxz,'2' as rylb,lk.zxbs,lk.rkfwglid
from t_lsgl_rk_ldrkzzxx lk

union all

select jw.JWBH as rkid,jw.rybh,jw.zrdwdm,jw.czdwdm,jw.djdwdm,'' hjdqh,'' hjdxz,'4'  as rylb,jw.zxbs,jw.rkfwglid
from t_lsgl_rk_jwrkxx jw

union all

select jz.JZBH as rkid,jz.rybh,jz.zrdwdm,jz.czdwdm,jz.djdwdm,'' hjdqh,'' hjdxz,'5'  as rylb,jz.zxbs,jz.rkfwglid
from t_lsgl_rk_jzrkxx jz

union all

select wlh.wlhrkbh as rkid,wlh.rybh,wlh.zrdwdm,wlh.czdwdm,wlh.djdwdm,'' hjdqh, '' hjdxz,'3' as rylb ,wlh.zxbs,wlh.rkfwglid
from t_lsgl_rk_wlhczhk wlh;


CREATE OR REPLACE VIEW V_LSGL_RK_WLHCZHK AS
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
      B.Hjdqh,
      B.Xzzxz,
      B.Hjdxz,
      '3' as rylb,
      C.WLHRKBH,
      C.CZJZL,
      C.CZJHM,
      C.WLHYY,
      TO_CHAR(C.WLHQSSJ,'YYYY-MM-DD') AS WLHQSSJ,
      C.YHJDQH,
      C.YHJDXZ,
      C.CSDXZ,
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
      C.Rkfwglid,
      C.SSGAJGJGDM,
      C.SSGAJGJGMC,
      C.SSPCSDM,
      C.SSPCSMC,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ desc) AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_WLHCZHK C ON B.RYBH = C.RYBH;
