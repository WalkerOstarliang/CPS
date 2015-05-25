-- Add/modify columns 
alter table T_AF_ZBHCYXX add SSSQDM VARCHAR2(12);
-- Add comments to the columns 
comment on column T_AF_ZBHCYXX.SSSQDM
  is '所属社区代码';
