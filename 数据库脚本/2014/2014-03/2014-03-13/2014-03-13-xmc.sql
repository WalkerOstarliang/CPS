-- Add/modify columns 
alter table T_ZDRY_WTXX add TGLX VARCHAR2(1) default 1;
-- Add comments to the table 
comment on table T_ZDRY_WTXX
  is '重点人员托管表';
-- Add comments to the columns 
comment on column T_ZDRY_WTXX.TGLX
  is '托管类型 1：人工托管 2：自动托管';
