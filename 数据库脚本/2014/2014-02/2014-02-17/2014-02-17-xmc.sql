-- Add/modify columns 
alter table T_LSGL_RK_ZPXX add YCFWZP VARCHAR2(1);
-- Add comments to the columns 
comment on column T_LSGL_RK_ZPXX.YCFWZP
  is '远程服务照片';
