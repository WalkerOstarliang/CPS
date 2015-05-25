-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add pcsdjpdsj date;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.pcsdjpdsj
  is '派出所等级评定时间';