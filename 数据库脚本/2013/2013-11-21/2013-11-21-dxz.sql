alter table T_ZA_RY_CYRY add xm varchar2(30);
alter table T_ZA_RY_CYRY add xb varchar2(2);
alter table T_ZA_RY_CYRY add csrq varchar2(10);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.xm
  is '姓名';
comment on column T_ZA_RY_CYRY.xb
  is '性别';
comment on column T_ZA_RY_CYRY.csrq
  is '出生日期';
  
  
  
  
  --从业人员视图
create or replace view v_za_ry_cyry as
select
    cyry.cyrybh,
    cyry.jgbh,
    cyry.bmmc,
    cyry.gzly,
    cyry.pynx,
    cyry.zw as zwlb,
    cyry.sjhm,
    cyry.qtlxdh,
    cyry.zsqk,
    cyry.pxzh,
    cyry.pxzs,
    cyry.zdfwdxlb,
    cyry.bwcs,
    cyry.kzcs,
    cyry.zygx,
    cyry.zywt,
    cyry.jcqk,
    cyry.bz,
    cyry.zxyy,
    cyry.zxbs,
    cyry.zxrq,
    cyry.czrxm,
    cyry.czdwdm,
    to_char(cyry.czsj,'yyyy-mm-dd HH24:mi:ss') as czsj,
    cyry.czbs,
    cyry.djdwdm,
    cyry.djdwmc,
    cyry.djrxm,
    to_char(cyry.djsj,'yyyy-mm-dd HH24:mi:ss') as djsj,
    cyry.czdwmc,
    to_char(cyry.lzsj,'yyyy-mm-dd') as lzsj,
    to_char(cyry.rzsj,'yyyy-mm-dd') as rzsj,
    cyry.cyryygh,
    cyry.xzdz,
    cyry.xm,
    cyry.xb,
    cyry.sfzh,
    cyry.csrq,
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc
from t_za_ry_cyry cyry;


  
  
  