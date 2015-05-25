-- Add/modify columns 
alter table T_ZA_RY_CYRY add GJ VARCHAR2(3);
alter table T_ZA_RY_CYRY add ZJZL VARCHAR2(3);
alter table T_ZA_RY_CYRY add zjhm VARCHAR2(30);
alter table T_ZA_RY_CYRY add ywx VARCHAR2(30);
alter table T_ZA_RY_CYRY add ywm VARCHAR2(30);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.GJ
  is '国籍';
comment on column T_ZA_RY_CYRY.ZJZL
  is '证件种类';
comment on column T_ZA_RY_CYRY.zjhm
  is '证号号码';
comment on column T_ZA_RY_CYRY.ywx
  is '英文姓';
comment on column T_ZA_RY_CYRY.ywm
  is '英文名';
