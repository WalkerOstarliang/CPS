-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX add ZXHQSJ date;
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.ZXHQSJ
  is '最新核签时间';

  
  -- Add/modify columns 
alter table T_LSGL_CZFW_JBXX modify ZXYY VARCHAR2(200);
  
  

update t_common_dictionary
set mc='承租人'
where zdlb='ZDY_LDRK_YHZGX' and dm='02';

commit;