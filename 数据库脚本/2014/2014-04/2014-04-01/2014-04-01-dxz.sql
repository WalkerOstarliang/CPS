-- Add/modify columns 
alter table T_COMMON_XTTX_PZ add downloadSql varchar2(3800);
-- Add comments to the columns 
comment on column T_COMMON_XTTX_PZ.downloadSql
  is '导出Excel的SQL';