-- Create table
create table T_COMMON_RSDQYDTJ
(
  DWDM       VARCHAR2(12),
  DWMC       VARCHAR2(120),
  LEVE       NUMBER,
  PARENTCODE VARCHAR2(12),
  JSSJ       DATE,
  ORGJC      VARCHAR2(120),
  RSDSL      NUMBER,
  TJYF       VARCHAR2(6)
);
-- Add comments to the table 
comment on table T_COMMON_RSDQYDTJ
  is '辖区发案情况统计';
-- Add comments to the columns 
comment on column T_COMMON_RSDQYDTJ.DWDM
  is '单位代码';
comment on column T_COMMON_RSDQYDTJ.DWMC
  is '单位名称';
comment on column T_COMMON_RSDQYDTJ.LEVE
  is '层级';
comment on column T_COMMON_RSDQYDTJ.PARENTCODE
  is '父代码';
comment on column T_COMMON_RSDQYDTJ.JSSJ
  is '计算时间';
comment on column T_COMMON_RSDQYDTJ.ORGJC
  is '机构简称';
comment on column T_COMMON_RSDQYDTJ.RSDSL
  is '入室盗窃按数量';
comment on column T_COMMON_RSDQYDTJ.TJYF
  is '统计月份';
