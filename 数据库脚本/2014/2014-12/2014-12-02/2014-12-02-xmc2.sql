-- Add/modify columns 
alter table T_TJFX_CZFWTJBB add TJYF VARCHAR2(6);
-- Add comments to the columns 
comment on column T_TJFX_CZFWTJBB.TJYF
  is '统计月份';
