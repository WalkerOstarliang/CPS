-- Create table
create table T_ZA_DW_JFDW_NSXX
(
  ID      VARCHAR2(10) not null,
  JGBH    VARCHAR2(27) not null,
  NSRJ    DATE,
  BADJ    VARCHAR2(2),
  BZ      VARCHAR2(500),
  DJRXM   VARCHAR2(50),
  DJRJH   VARCHAR2(20),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(120),
  DJRSFZH VARCHAR2(18),
  CZRXM   VARCHAR2(50),
  CZRJH   VARCHAR2(20),
  CZDWDM  VARCHAR2(12),
  CZDWMC  VARCHAR2(120),
  CZRSFZH VARCHAR2(18),
  CZBS    VARCHAR2(2)
);
-- Add comments to the table 
comment on table T_ZA_DW_JFDW_NSXX
  is '技防单位年审信息';
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW_NSXX.ID
  is '主键ID';
comment on column T_ZA_DW_JFDW_NSXX.JGBH
  is '机构编号';
comment on column T_ZA_DW_JFDW_NSXX.NSRJ
  is '年审时间';
comment on column T_ZA_DW_JFDW_NSXX.BADJ
  is '备案等级';
comment on column T_ZA_DW_JFDW_NSXX.BZ
  is '备注';
comment on column T_ZA_DW_JFDW_NSXX.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_JFDW_NSXX.DJRJH
  is '登记人警号';
comment on column T_ZA_DW_JFDW_NSXX.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_JFDW_NSXX.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_JFDW_NSXX.DJRSFZH
  is '登记人身份证号';
comment on column T_ZA_DW_JFDW_NSXX.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_JFDW_NSXX.CZRJH
  is '操作人警号';
comment on column T_ZA_DW_JFDW_NSXX.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_JFDW_NSXX.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_JFDW_NSXX.CZRSFZH
  is '操作人身份证号';
comment on column T_ZA_DW_JFDW_NSXX.CZBS
  is '操作标识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_JFDW_NSXX
  add primary key (ID);

  
-- Create sequence 
create sequence SEQ_JFDW_NSID
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1;