-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_SJJS add sn number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_SJJS.sn
  is '排序字段';