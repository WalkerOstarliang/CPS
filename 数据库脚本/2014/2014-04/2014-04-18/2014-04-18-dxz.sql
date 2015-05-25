-- Add/modify columns 
alter table T_ZA_RY_CYRY add jzdpcsdm varchar2(12);
alter table T_ZA_RY_CYRY add jzdpcsmc varchar2(120);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.jzdpcsdm
  is '居住地派出所代码';
comment on column T_ZA_RY_CYRY.jzdpcsmc
  is '居住地派出所名称';
  
create or replace view v_za_ry_cyry as
select
    cyry.cyrybh,
    cyry.rybh,
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
    cyry.mz,
    cyry.bmch,
    cyry.sfabry,
    cyry.rkfwglid,
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc,
    (select hylb from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as hylb,
    cyry.djrjh,
    cyry.czrjh,
    cyry.XZDJWQ,
    (select orgname from v_common_organization where orgcode=cyry.XZDJWQ and rownum=1) as xzdjwqmc,
    cyry.FKRXM,
    cyry.FKDWDM,
    cyry.FKDWMC,
    cyry.FKSJ,
    cyry.FKNR,
    cyry.jzdpcsdm,
    cyry.jzdpcsmc,
    rkjbxx.xzzzrq,
    rkjbxx.lxdh,
    rkjbxx.xzzxz,
    rkjbxx.sspcsdm,
    cyry.jzdsqdm,
     cyry.jzdsqmc
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;


-- Create table
create table T_ZA_RY_CYRYPFXX
(
  ID      VARCHAR2(20) not null,
  RYBH    VARCHAR2(27),
  CYRYBH  VARCHAR2(27),
  JZDSQDM VARCHAR2(12),
  JZDSQMC VARCHAR2(120),
  PFRXM   VARCHAR2(50),
  PFRJH   VARCHAR2(20),
  PFRSFZH VARCHAR2(18),
  PFSJ    DATE,
  PFDWMC  VARCHAR2(120),
  PFDWDM  VARCHAR2(12)
);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRYPFXX.ID
  is '主键ID';
comment on column T_ZA_RY_CYRYPFXX.RYBH
  is '人员编号';
comment on column T_ZA_RY_CYRYPFXX.CYRYBH
  is '从业人员编号';
comment on column T_ZA_RY_CYRYPFXX.JZDSQDM
  is '从业人员居住地社区代码';
comment on column T_ZA_RY_CYRYPFXX.JZDSQMC
  is '从业人员居住社区名称';
comment on column T_ZA_RY_CYRYPFXX.PFRXM
  is '派发人信息';
comment on column T_ZA_RY_CYRYPFXX.PFRJH
  is '派发人警号';
comment on column T_ZA_RY_CYRYPFXX.PFRSFZH
  is '派发人身份证';
comment on column T_ZA_RY_CYRYPFXX.PFSJ
  is '派发时间';
comment on column T_ZA_RY_CYRYPFXX.PFDWMC
  is '派发单位名称';
comment on column T_ZA_RY_CYRYPFXX.PFDWDM
  is '派发单位代码';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_RY_CYRYPFXX
  add primary key (ID);

-- Create sequence 
create sequence seq_za_cyrypf_id
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;
  