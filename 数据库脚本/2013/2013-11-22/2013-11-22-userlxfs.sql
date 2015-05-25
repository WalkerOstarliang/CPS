-- Add/modify columns 
alter table T_COMMON_USER_LXFS modify id not null;
alter table T_COMMON_USER_LXFS add xm varchar2(60);
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.xm
  is '姓名';
-- Add/modify columns 
alter table T_COMMON_USER_LXFS add orgdwdm varchar2(20);
alter table T_COMMON_USER_LXFS add orgdwmc varchar2(120);
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.orgdwdm
  is '单位代码';
comment on column T_COMMON_USER_LXFS.orgdwmc
  is '单位名称';