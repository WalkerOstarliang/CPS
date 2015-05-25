-- Add/modify columns 
alter table T_ZA_DW_JFDW_NSXX add sfjc varchar2(3);
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW_NSXX.sfjc
  is '是否检测';
