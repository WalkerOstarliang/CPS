-- Add/modify columns 
alter table T_COMMON_XTTX_PZ add iconpath varchar2(1000);
-- Add comments to the columns 
comment on column T_COMMON_XTTX_PZ.iconpath
  is '系统图片地址';
