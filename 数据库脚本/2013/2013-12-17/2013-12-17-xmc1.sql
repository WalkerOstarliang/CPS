create table T_COMMON_SQLEXEPZ
(
  DM  VARCHAR2(50),
  SQL CLOB
);

-- Add/modify columns 
alter table T_ZDRY_GZDX add GXDWDM VARCHAR2(12);
alter table T_ZDRY_GZDX add GXDWMC VARCHAR2(120);
-- Add comments to the columns 
comment on column T_ZDRY_GZDX.GXDWDM
  is '管辖单位代码';
comment on column T_ZDRY_GZDX.GXDWMC
  is '关系单位名称';

-- Add comments to the columns 
comment on column T_ZDRY_GZDX.RYLB
  is '人员类别                 RYLB 不再使用';
comment on column T_ZDRY_GZDX.DXLB
  is '对象类别                       ZDDXLB     ';

  
create or replace view v_lsgl_rk_syrk as
select czrk.czrkbh as rkid,czrk.rybh,czrk.zrdwdm,czrk.czdwdm,czrk.djdwdm,czrk.hjdqh,czrk.hjdxz,'1' as rylb
from t_lsgl_rk_czrk czrk

union all


select lk.ZZBH as rkid,lk.rybh,lk.zrdwdm,lk.czdwdm,lk.djdwdm,'' hjdqh,'' hjdxz,'2' as rylb
from t_lsgl_rk_ldrkzzxx lk

union all

select wlh.WLHRKBH as rkid,wlh.rybh,wlh.zrdwdm,wlh.czdwdm,wlh.djdwdm,'' hjdqh,'' hjdxz,'3' as rylb
from t_lsgl_rk_wlhczhk wlh

union all

select jw.JWBH as rkid,jw.rybh,jw.zrdwdm,jw.czdwdm,jw.djdwdm,'' hjdqh,'' hjdxz,'4'  as rylb
from t_lsgl_rk_jwrkxx jw

union all

select jz.JZBH as rkid,jz.rybh,jz.zrdwdm,jz.czdwdm,jz.djdwdm,'' hjdqh,'' hjdxz,'5'  as rylb
from t_lsgl_rk_jzrkxx jz;
  