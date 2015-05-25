-- Add/modify columns 
alter table T_ZA_DW_WXWPDW add ywxtzjid varchar2(50);
-- Add comments to the columns 
comment on column T_ZA_DW_WXWPDW.ywxtzjid
  is '业务系统主表主键ID';
