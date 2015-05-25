-- Add/modify columns 
alter table T_GZGL_GZRZ add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_GZGL_GZRZ.djrsfzh
  is '登记人身份证号码';
  
  
  -- Add/modify columns 
alter table T_GZGL_GZZJ add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_GZGL_GZZJ.djrsfzh
  is '登记人身份证号码';
  
  
  
  -- Add/modify columns 
alter table T_ZYQB_SJXX add cjrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZYQB_SJXX.cjrsfzh
  is '采集人身份证号码';