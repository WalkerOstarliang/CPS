-- Create table
create table T_GZGL_JQTB
(
  ID       VARCHAR2(20) not null,
  XSAJ     VARCHAR2(10),
  ZAAJ     VARCHAR2(10),
  TCJF     VARCHAR2(10),
  ZHSG     VARCHAR2(10),
  QJQDAJ   VARCHAR2(10),
  RSDQAJ   VARCHAR2(10),
  DQJDCLAJ VARCHAR2(10),
  QTAJ     VARCHAR2(10),
  DQFFZD   VARCHAR2(200),
  DJRXM    VARCHAR2(30),
  DJSJ     DATE,
  ZRDWDM   VARCHAR2(30),
  ZRDWMC   VARCHAR2(120),
  NY       VARCHAR2(10)
)

-- Add comments to the table 
comment on table T_GZGL_JQTB
  is '警情通报';
-- Add comments to the columns 
comment on column T_GZGL_JQTB.ID
  is '主键ID';
comment on column T_GZGL_JQTB.XSAJ
  is '刑事案件';
comment on column T_GZGL_JQTB.ZAAJ
  is '治安案件';
comment on column T_GZGL_JQTB.TCJF
  is '调处纠纷';
comment on column T_GZGL_JQTB.ZHSG
  is '灾害事故';
comment on column T_GZGL_JQTB.QJQDAJ
  is '抢劫抢夺案件';
comment on column T_GZGL_JQTB.RSDQAJ
  is '入室盗窃案件';
comment on column T_GZGL_JQTB.DQJDCLAJ
  is '盗窃机动车辆案件';
comment on column T_GZGL_JQTB.QTAJ
  is '其他案件';
comment on column T_GZGL_JQTB.DQFFZD
  is '当前防范重点';
comment on column T_GZGL_JQTB.DJRXM
  is '登记人姓名';
comment on column T_GZGL_JQTB.DJSJ
  is '登记时间';
comment on column T_GZGL_JQTB.ZRDWDM
  is '责任单位代码';
comment on column T_GZGL_JQTB.ZRDWMC
  is '责任单位名称';
comment on column T_GZGL_JQTB.NY
  is '年月';

-- Create sequence 
create sequence T_GZGL_JQTB_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;


