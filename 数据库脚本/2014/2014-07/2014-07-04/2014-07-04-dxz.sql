-- Add/modify columns 
alter table T_ZA_DWHC add zddwbz varchar2(3);
-- Add comments to the columns 
comment on column T_ZA_DWHC.zddwbz
  is '重点单位标识';