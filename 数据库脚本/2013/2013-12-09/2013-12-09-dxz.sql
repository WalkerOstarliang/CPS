insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZAGL_RY_ZW', '职务', '34', '保卫干部', 'abry', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZAGL_RY_ZW', '职务', '35', '护卫队员', 'abry', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZAGL_RY_ZW', '职务', '36', '保安', 'abry', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZAGL_RY_ZW', '职务', '37', '武警', 'abry', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZAGL_RY_ZW', '职务', '38', '其他保卫人员', 'abry', '', '1', null);
update t_common_dictionary set parent_dm = 'abry' where zdlb = 'ZAGL_RY_ZW' and (dm = '04' or dm = '02');

-- Add/modify columns 
alter table T_ZA_RY_CYRY add sfabry varchar2(1);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.sfabry
  is '是否安保人员（0：否、1：是）';
  
  
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
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc,
    (select hylb from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as hylb
from t_za_ry_cyry cyry where exists (select 1 from t_lsgl_rk_jbxx rk where rk.rybh = cyry.rybh);
  

