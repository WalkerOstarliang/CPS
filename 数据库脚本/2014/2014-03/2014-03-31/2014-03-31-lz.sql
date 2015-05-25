-- Add/modify columns 
alter table T_LSGL_LDRK_YQZX add ynjzrq date;
-- Add comments to the columns 
comment on column T_LSGL_LDRK_YQZX.ynjzrq
  is '原拟居住日期';