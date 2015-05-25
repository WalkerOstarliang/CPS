-- Add/modify columns 
alter table T_ZDRY_XSBX add qcxfzcs number;
-- Add comments to the columns 
comment on column T_ZDRY_XSBX.qcxfzcs
  is '侵财性犯罪次数';
