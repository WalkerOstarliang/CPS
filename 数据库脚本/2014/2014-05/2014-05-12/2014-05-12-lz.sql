-- Add/modify columns 
alter table T_COMMON_DZJLX add sfmzmm varchar2(2);
-- Add comments to the columns 
comment on column T_COMMON_DZJLX.sfmzmm
  is '是否民政命名';