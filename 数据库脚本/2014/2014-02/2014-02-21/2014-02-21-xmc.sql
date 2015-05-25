alter table T_LSGL_RK_ZPXX add YCFWZP VARCHAR2(1);
alter table T_LSGL_RK_ZPXX add RXFW date;
-- Add comments to the columns 
comment on column T_LSGL_RK_ZPXX.YCFWZP
  is '是否远程服务照片';
comment on column T_LSGL_RK_ZPXX.RXFW
  is '人像方位';

-- Add/modify columns 
alter table T_LSGL_RK_ZPXX add zxbs VARCHAR2(1);
alter table T_LSGL_RK_ZPXX add zxsj date;
-- Add comments to the columns 
comment on column T_LSGL_RK_ZPXX.zxbs
  is '注销标示 0：正常 1：注销';
comment on column T_LSGL_RK_ZPXX.zxsj
  is '注销时间';
