-- Add/modify columns 
alter table T_ZDRY_RYPF add xzsqdm varchar2(20);
-- Add comments to the columns 
comment on column T_ZDRY_RYPF.xzsqdm
  is '行政社区代码';