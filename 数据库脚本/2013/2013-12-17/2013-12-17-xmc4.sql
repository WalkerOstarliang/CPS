-- Add/modify columns 
alter table T_ZDRY_GZDX add ZXLASJ date;
-- Add comments to the columns 
comment on column T_ZDRY_GZDX.GXDWMC
  is '管辖单位名称';
comment on column T_ZDRY_GZDX.ZXLASJ
  is '最新立案时间';
