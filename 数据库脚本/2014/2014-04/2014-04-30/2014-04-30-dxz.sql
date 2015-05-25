-- Add/modify columns 
alter table T_ZA_DW_JFDW_NSXX add nr varchar2(500);
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW_NSXX.nr
  is '内容';
  -- Add/modify columns 
alter table T_ZA_DW_JFDW_NSXX add djsj date;
alter table T_ZA_DW_JFDW_NSXX add czsj date;
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW_NSXX.djsj
  is '登记时间';
comment on column T_ZA_DW_JFDW_NSXX.czsj
  is '操作时间';
  
delete t_common_dictionary where zdmc = '行业类别' and dm='09';
commit;