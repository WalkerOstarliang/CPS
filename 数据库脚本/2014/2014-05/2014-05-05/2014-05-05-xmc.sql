insert into t_common_hnxzqh (DM, MC, PARENT_DM, LEVE, JC, ISVALID, LEN, SSPCSDM, SSJWSDM, CXFL, ZHJC)
values ('430199000000', '湖南省长沙市高新区', '430100000000', '3', '高新区', '1', null, '', '', '', '高');
commit;

-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LSGL_CZFW_JBXX
  add constraint T_LSGL_CZFW_JBXX_unique_czfwbh unique (CZFWBH);
