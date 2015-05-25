-- Add/modify columns 
alter table T_ZA_JG_JBXX modify FRSFZHM VARCHAR2(30);
-- Add comments to the columns 
comment on column T_ZA_JG_JBXX.FRSFZHM
  is '法人身份证';
