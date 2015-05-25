-- Add/modify columns 
alter table T_COMMON_DZJLX add gxsj date;
-- Add comments to the columns 
comment on column T_COMMON_DZJLX.gxsj
  is ' 更新时间';
