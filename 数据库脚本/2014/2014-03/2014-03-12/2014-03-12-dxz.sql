-- Add/modify columns 
alter table T_ZDRY_XSBX add zdrylxfs varchar2(30);
alter table T_ZDRY_XSBX add lxfsbz varchar2(100);
-- Add comments to the columns 
comment on column T_ZDRY_XSBX.zdrylxfs
  is '重点人员联系方式';
comment on column T_ZDRY_XSBX.lxfsbz
  is '重点人员联系方式备注';
