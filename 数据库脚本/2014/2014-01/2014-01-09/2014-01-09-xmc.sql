-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add NJZRQ date;
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.NJZRQ
  is '拟居住日期';

  delete from t_common_dictionary where zdlb='ZDY_NJZQX' and dm='9';
  commit;
  
  
  -- Add/modify columns 
alter table T_ZA_RY_CYRY add XZDJWQ VARCHAR2(12);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.XZDJWQ
  is '现住地警务区';
  
-- Add/modify columns 
alter table T_ZA_RY_CYRY add fkrxm VARCHAR2(30);
alter table T_ZA_RY_CYRY add fkrjh VARCHAR2(6);
alter table T_ZA_RY_CYRY add fkdwdm VARCHAR2(12);
alter table T_ZA_RY_CYRY add fkdwmc VARCHAR2(120);
alter table T_ZA_RY_CYRY add fksj date;
alter table T_ZA_RY_CYRY add fknr VARCHAR2(1000);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.fkrxm
  is '反馈人姓名';
comment on column T_ZA_RY_CYRY.fkrjh
  is '反馈人警号';
comment on column T_ZA_RY_CYRY.fkdwdm
  is '反馈单位代码';
comment on column T_ZA_RY_CYRY.fkdwmc
  is '反馈单位名称';
comment on column T_ZA_RY_CYRY.fksj
  is '反馈时间';
comment on column T_ZA_RY_CYRY.fknr
  is '反馈内容';
  