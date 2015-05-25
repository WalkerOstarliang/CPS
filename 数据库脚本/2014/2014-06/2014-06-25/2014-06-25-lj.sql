-- Create table
create table T_ZA_NB_DWJC_ZP
(
  ZPID   VARCHAR2(24) not null,
  YHDD   VARCHAR2(10),
  YHDDZP BLOB,
  DJSJ   DATE,
  AQJCID VARCHAR2(20),
  JGBH   VARCHAR2(27),
  DWLB   VARCHAR2(3)
);
-- Add comments to the table 
comment on table T_ZA_NB_DWJC_ZP
  is '内保单位安全检查照片表';
-- Add comments to the columns 
comment on column T_ZA_NB_DWJC_ZP.ZPID
  is '内保安全检查隐患照片ID';
comment on column T_ZA_NB_DWJC_ZP.YHDD
  is '内保安全检查隐患地点（存放安全检查表的字段名称）';
comment on column T_ZA_NB_DWJC_ZP.YHDDZP
  is '内保安全检查隐患地点照片';
comment on column T_ZA_NB_DWJC_ZP.DJSJ
  is '内保安全检查隐患照片上传时间';
comment on column T_ZA_NB_DWJC_ZP.AQJCID
  is '内保安全检查表ID';
comment on column T_ZA_NB_DWJC_ZP.JGBH
  is '内保单位机构编号';
comment on column T_ZA_NB_DWJC_ZP.DWLB
  is '内保单位类别';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_NB_DWJC_ZP
  add constraint NBAQJCZPID primary key (ZPID);
  
  
  -- Create sequence 
create sequence SEQ_NBAJZPID
minvalue 100000000000000000000001
maxvalue 999999999999999999999999
start with 100000000000000000000001
increment by 1;
  
