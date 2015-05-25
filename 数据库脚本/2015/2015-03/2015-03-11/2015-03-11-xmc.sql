-- Add comments to the columns 
comment on column T_COMMON_STXX.SFJWTDJ
  is '数据来源标示 0：内网PC， 1：警务通登记 2：外网采集';

  
  
-- Add/modify columns 
alter table T_ZA_JG_JBXX add SFJWTDJ VARCHAR2(1);
-- Add comments to the columns 
comment on column T_ZA_JG_JBXX.SFJWTDJ
  is '数据来源标示 0：内网PC， 1：警务通登记 2：外网采集';
  