INSERT INTO t_common_dictionary VALUES(SEQ_common.Nextval,'ZAGL_GLBM','管理部门','5','消防','','','1','');
COMMIT;

-- Create table
create table T_ZA_DWHC
(
  id      VARCHAR2(20) not null,
  jgbh    VARCHAR2(27) not null,
  nbhc    VARCHAR2(1),
  zahc    VARCHAR2(1),
  xfhc    VARCHAR2(1),
  wjhc    VARCHAR2(1),
  hcrxm   VARCHAR2(30),
  hcrjh   VARCHAR2(20),
  hcrsfzh VARCHAR2(18),
  hcdwdm  VARCHAR2(12),
  hcdwmc  VARCHAR2(120),
  hcsj    DATE
);
-- Add comments to the table 
comment on table T_ZA_DWHC
  is '单位核查';
-- Add comments to the columns 
comment on column T_ZA_DWHC.id
  is '主键ID';
comment on column T_ZA_DWHC.jgbh
  is '机构编号';
comment on column T_ZA_DWHC.nbhc
  is '内保核查（1  已确认 0 未确认）';
comment on column T_ZA_DWHC.zahc
  is '治安核查（1  已确认 0 未确认）';
comment on column T_ZA_DWHC.xfhc
  is '消防核查（1  已确认 0 未确认）';
comment on column T_ZA_DWHC.wjhc
  is '网监核查（1  已确认 0 未确认）';
comment on column T_ZA_DWHC.hcrxm
  is '核查人姓名';
comment on column T_ZA_DWHC.hcrjh
  is '核查人警号';
comment on column T_ZA_DWHC.hcrsfzh
  is '核查人身份证号';
comment on column T_ZA_DWHC.hcdwdm
  is '核查单位代码';
comment on column T_ZA_DWHC.hcdwmc
  is '核查单位名称';
comment on column T_ZA_DWHC.hcsj
  is '核查时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DWHC
  add primary key (ID);
  
  -- Create sequence 
create sequence SEQ_ZA_DWHC_ID
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;
