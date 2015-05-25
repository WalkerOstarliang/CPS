-- Add/modify columns 
alter table T_ZDRY_GZDX add SSXZSQ VARCHAR2(12);
-- Add comments to the columns 
comment on column T_ZDRY_GZDX.SSXZSQ
  is '所属行政社区';
