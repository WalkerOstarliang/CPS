create or replace view v_lsgl_rk_syrk as
select czrk.czrkbh as rkid,czrk.rybh,czrk.zrdwdm,czrk.czdwdm,czrk.djdwdm,czrk.hjdqh,czrk.hjdxz,'1' as rylb,czrk.zxbs,czrk.rkfwglid,czrk.zxsj,czrk.djsj,czrk.djdwmc
from t_lsgl_rk_czrk czrk

union all

select lk.ZZBH as rkid,lk.rybh,lk.zrdwdm,lk.czdwdm,lk.djdwdm,'' hjdqh,'' hjdxz,'2' as rylb,lk.zxbs,lk.rkfwglid,lk.zxsj,lk.djsj,lk.djdwmc
from t_lsgl_rk_ldrkzzxx lk

union all

select jw.JWBH as rkid,jw.rybh,jw.zrdwdm,jw.czdwdm,jw.djdwdm,'' hjdqh,'' hjdxz,'4'  as rylb,jw.zxbs,jw.rkfwglid,jw.zxsj,jw.djsj,jw.djdwmc
from t_lsgl_rk_jwrkxx jw

union all

select jz.JZBH as rkid,jz.rybh,jz.zrdwdm,jz.czdwdm,jz.djdwdm,'' hjdqh,'' hjdxz,'5'  as rylb,jz.zxbs,jz.rkfwglid,jz.zxsj,jz.djsj,jz.djdwmc
from t_lsgl_rk_jzrkxx jz

union all

select wlh.wlhrkbh as rkid,wlh.rybh,wlh.zrdwdm,wlh.czdwdm,wlh.djdwdm,'' hjdqh, '' hjdxz,'3' as rylb ,wlh.zxbs,wlh.rkfwglid,wlh.zxsj,wlh.djsj,wlh.djdwmc
from t_lsgl_rk_wlhczhk wlh;


CREATE OR REPLACE FUNCTION F_GET_RYBHBYSFZH(v_sfzh VARCHAR2) RETURN varchar2
--根据rybh查询sfzh
AS
       v_rybh    VARCHAR2(20);
BEGIN
       SELECT rybh INTO v_rybh FROM t_lsgl_rk_jbxx where sfzh = v_sfzh;
       RETURN v_rybh;
END;
/
