delete from ptgl.td_sm_function where function_id='SQJW1000001156';
commit;

-- Add/modify columns 
alter table T_LSGL_FW_CZWXCDJ modify XCMJXM VARCHAR2(300);
-- Add comments to the columns 
comment on column T_LSGL_FW_CZWXCDJ.XCMJXM
  is '巡查民警姓名多个使用","分隔';