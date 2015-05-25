-- Add/modify columns 
alter table T_ZA_WYXQ add dwfzrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZA_WYXQ.dwfzrsfzh
  is '单位负责人身份证';