-- Add/modify columns 
alter table T_AF_SQGBXX add WHCD VARCHAR2(3);
-- Add comments to the columns 
comment on column T_AF_SQGBXX.WHCD
  is '文化程度 字典：GB_WHCD';

  
-- Add comments to the columns 
comment on column T_AF_SQJBXX.JDXZFZR
  is '社区负责人';
comment on column T_AF_SQJBXX.JDXZFZRDH
  is '社区联系电话';
  
-- Add/modify columns 
alter table T_AF_ZBHJBXX add SSSQDM VARCHAR2(12);
alter table T_AF_ZBHJBXX add SSSQMC VARCHAR2(120);
-- Add comments to the columns 
comment on column T_AF_ZBHJBXX.SSSQDM
  is '所属社区代码';
comment on column T_AF_ZBHJBXX.SSSQMC
  is '所属社区名称';
  
  
-- Add/modify columns 
alter table T_AF_ZBHCYXX modify TCBS default 0;
  