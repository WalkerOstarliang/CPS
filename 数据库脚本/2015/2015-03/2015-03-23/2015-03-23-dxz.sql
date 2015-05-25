-- Create table
create table T_AF_ZAXL
(
  id      VARCHAR2(27) not null,
  xlry    VARCHAR2(200),
  xlsj    DATE,
  xldx    VARCHAR2(200),
  xlsqdm  VARCHAR2(12),
  xlqk    VARCHAR2(1000),
  bz      VARCHAR2(1000),
  djrxm   VARCHAR2(30),
  djrjh   VARCHAR2(20),
  djrsfzh VARCHAR2(18),
  djsj    DATE,
  djdwdm  VARCHAR2(12),
  djdwmc  VARCHAR2(120),
  czrxm   VARCHAR2(30),
  czrjh   VARCHAR2(20),
  czrsfzh VARCHAR2(18),
  czdwdm  VARCHAR2(12),
  czdwmc  VARCHAR2(120),
  czsj    DATE,
  czbs    VARCHAR2(1)
);
-- Add comments to the columns 
comment on column T_AF_ZAXL.id
  is '主键（6位行政区划 + 14位时间 + 7位序列）';
comment on column T_AF_ZAXL.xlry
  is '巡逻人员';
comment on column T_AF_ZAXL.xlsj
  is '巡逻时间';
comment on column T_AF_ZAXL.xldx
  is '巡逻对象';
comment on column T_AF_ZAXL.xlsqdm
  is '巡逻社区代码';
comment on column T_AF_ZAXL.xlqk
  is '巡逻情况';
comment on column T_AF_ZAXL.bz
  is '备注';
comment on column T_AF_ZAXL.djrxm
  is '登记人姓名';
comment on column T_AF_ZAXL.djrjh
  is '登记人警号';
comment on column T_AF_ZAXL.djrsfzh
  is '登记人身份证';
comment on column T_AF_ZAXL.djsj
  is '登记时间';
comment on column T_AF_ZAXL.djdwdm
  is '登记单位代码';
comment on column T_AF_ZAXL.djdwmc
  is '登记单位名称';
comment on column T_AF_ZAXL.czrxm
  is '操作人姓名';
comment on column T_AF_ZAXL.czrjh
  is '操作人警号';
comment on column T_AF_ZAXL.czrsfzh
  is '操作人身份证';
comment on column T_AF_ZAXL.czdwdm
  is '操作单位代码';
comment on column T_AF_ZAXL.czdwmc
  is '操作单位名称';
comment on column T_AF_ZAXL.czsj
  is '操作时间';
comment on column T_AF_ZAXL.czbs
  is '操作标识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_AF_ZAXL
  add primary key (ID);
  
  
-- Create sequence 
create sequence SEQ_ZALXID
minvalue 1000001
maxvalue 9999999
start with 1000001
increment by 1
cycle; 

-- Add/modify columns 
alter table T_AF_ZAXL add xldxlxfs varchar2(120);
-- Add comments to the columns 
comment on column T_AF_ZAXL.xldxlxfs
  is '巡逻对象联系方式'; 

